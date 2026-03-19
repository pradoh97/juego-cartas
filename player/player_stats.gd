extends MarginContainer
class_name PlayerStats

@export var stats: Dictionary[Stat, StatUI]

func _ready():
	for stat in stats:
		var ui_node = stats[stat]
		var transition: bool = false
		ui_node.initialize(stat.modifier)
		ui_node.set_value(stat.amount, transition)

func throw_dice(amount: int = 1):
	var throw_value = 0

	for throws in amount:
		throw_value += randi_range(1, 6)

	return throw_value

func set_stats(selected_card: Card):
	for stat in selected_card.stats.stat:
		var modifier_type: Modifier.MODIFIER_TYPE = (stat as Stat).modifier.type
		var amount: int = (stat as Stat).amount

		for player_stat in stats:
			if player_stat.modifier.type == modifier_type:
				var dice_multiplier = throw_dice(abs(stat.amount))
				player_stat.amount += stat.amount * dice_multiplier

				var ui_node: StatUI = stats[player_stat]
				ui_node.set_value(player_stat.amount)
