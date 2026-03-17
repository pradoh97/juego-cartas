extends MarginContainer
class_name PlayerStats

@export var stats: Dictionary[Modifier, Stat]

func _ready():
	for modifier in stats:
		var ui_node: Stat = stats[modifier]
		var transition: bool = false
		ui_node.initialize(modifier)
		ui_node.set_value(modifier.amount, transition)
