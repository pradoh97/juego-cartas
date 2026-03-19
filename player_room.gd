extends Node2D
class_name PlayerRoom

@export var card_options_scene: PackedScene
@export var player_stats: PlayerStats
@export var days: Array[Day]
var day: int = 0
var turn: int = 0
var current_draft: CardOptions

func new_draft():
	var card_options_instance: CardOptions = card_options_scene.instantiate()
	var card_options: Array[Card] = []
	var available_cards = days[day].work_cards

	if turn >= 3:
		available_cards = days[day].leisure_cards

	var cards_to_draft = min(days[day].cards_per_turn, available_cards.size())
	for card_number in cards_to_draft:
		var amount_of_turn_cards = available_cards.size()
		var random_card_index = randi_range(0, amount_of_turn_cards - 1)

		var selected_card: Card = available_cards.pop_at(random_card_index)
		card_options.append(selected_card)

	card_options_instance.set_cards(card_options)
	$CanvasLayer2.add_child(card_options_instance)
	current_draft = card_options_instance

func clear_draft():
	if current_draft:
		current_draft.queue_free()
		current_draft = null

func new_turn():
	clear_draft()
	turn += 1
	#Move to next day.
	if turn > 4:
		turn = 0
		day += 1
	if day <= days.size() - 1:
		new_draft()

	if current_draft:
		current_draft.connect_card_signals_to(_on_card_selected)

func _on_start_game_pressed():
	$CanvasLayer2/StartGame.queue_free()
	$CanvasLayer2/PanelContainer.queue_free()
	new_turn()

func _on_card_selected(card):
	player_stats.set_stats(card)
	new_turn()
