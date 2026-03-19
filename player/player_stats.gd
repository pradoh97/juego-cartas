extends MarginContainer
class_name PlayerStats

@export var stats: Dictionary[Stat, StatUI]

func _ready():
	for stat in stats:
		var ui_node = stats[stat]
		var transition: bool = false
		ui_node.initialize(stat.modifier)
		ui_node.set_value(stat.amount, transition)

func set_stats(selected_card: Card):
	for stat in selected_card.stats.stat:
		var modifier_type: Modifier.MODIFIER_TYPE = (stat as Stat).modifier.type
		var amount: int = (stat as Stat).amount
		for player_stat in stats:
			if player_stat.modifier.type == modifier_type:
				player_stat.amount += stat.amount
