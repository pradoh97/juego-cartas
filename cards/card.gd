extends Resource
class_name Card

@export var text: String
@export var stats: Stats
@export var hide_if_shown: bool = true
var shown: bool = false
var used: bool = false

func mark_as_used():
	used = true

func mark_as_shown():
	shown = true
