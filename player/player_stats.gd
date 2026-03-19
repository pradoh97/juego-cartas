extends MarginContainer
class_name PlayerStats

signal stat_changed(modifier_type: Modifier.MODIFIER_TYPE, amount: int)

@export var stats_ui: Dictionary[Modifier.MODIFIER_TYPE, StatUI]
@export var stats: Dictionary[Modifier.MODIFIER_TYPE, Stat]

func _ready():
	visible = false
	for modifier_type in stats:
		var ui_node: StatUI = stats_ui[modifier_type]
		var transition: bool = false
		var stat: Stat = stats[modifier_type]

		ui_node.initialize(stat.modifier)
		ui_node.set_value(stat.amount, transition)

func throw_dice(amount: int = 1):
	var throw_value = 0

	for throws in amount:
		throw_value += randi_range(1, 6)

	return throw_value

func set_stats(selected_card: Card):
	for card_stat in selected_card.stats.stat:
		var modifier_type = card_stat.modifier.type
		var ui_node: StatUI = stats_ui[modifier_type]
		var transition: bool = false
		var dice_multiplier = throw_dice(abs(card_stat.amount))
		var new_value = stats[modifier_type].amount + sign(card_stat.amount) * dice_multiplier
		stats[modifier_type].amount = new_value
		ui_node.set_value(new_value, transition)
		stat_changed.emit(modifier_type, new_value)

func update_day_turn(day: int, turn: int):
	%Day.set_value(day)
	%Turn.set_value(turn)

func display_stats():
	visible = true
