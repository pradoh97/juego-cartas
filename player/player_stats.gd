extends Node
class_name PlayerStats

@export var initial_obedience := 40
@export var initial_morale := 20
@export var initial_money := 50
@export var initial_promotion_progress := 10
@export var initial_expenses := 20

var _obedience
var _morale
var _money
var _promotion_progress
var _expenses

func _ready():
	set_obedience(initial_obedience)
	set_morale(initial_morale)
	set_money(initial_money)
	set_promotion_progress(initial_promotion_progress)
	set_expenses(initial_expenses)

func set_obedience(new_obedience: int):
	_obedience = new_obedience

func set_morale(new_morale: int):
	_morale = new_morale

func set_money(new_money: int):
	_money = new_money

func set_promotion_progress(new_promotion_progress: int):
	_promotion_progress = new_promotion_progress

func set_expenses(new_expenses: int):
	_expenses = new_expenses
