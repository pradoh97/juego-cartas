extends Resource
class_name Card

@export var text: String
@export var stats: Stats
var used: bool = false

func mark_as_used():
	used = true
