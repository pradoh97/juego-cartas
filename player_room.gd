extends Node2D
class_name PlayerRoom

@export var card_options_scene: PackedScene
@export var player_stats: PlayerStats
@export var days: Array[Day]
var day: int = 0
var turn: int = 0
var current_draft: UICardOptions

func new_draft():
	var draft: Array[Card] = []
	var ui_card_options_instance: UICardOptions = card_options_scene.instantiate()
	var card_options: CardOptions = CardOptions.new()
	var available_cards: Array[Card] = []
	card_options.cards = days[day].work_cards

	if turn >= 2:
		card_options.cards = days[day].leisure_cards

	available_cards = card_options.get_available_cards()

	var cards_to_draft = min(days[day].cards_per_turn, available_cards.size())

	for card_number in cards_to_draft:
		var amount_of_turn_cards = available_cards.size() - 1
		var random_card_index = randi_range(0, amount_of_turn_cards)

		var selected_card: Card = available_cards.pop_at(random_card_index)
		draft.append(selected_card)

	ui_card_options_instance.set_cards(draft)
	$CanvasLayer2.add_child(ui_card_options_instance)
	current_draft = ui_card_options_instance

func clear_draft():
	if current_draft:
		current_draft.queue_free()
		current_draft = null

func new_turn():
	clear_draft()
	update_day_turn()

	if turn == 2:
		var lights_tween = create_tween()
		lights_tween.tween_property($Room, "modulate", Color("#595959"), $TurnTransitionTimer.wait_time)
	if turn == 0:
		var lights_tween = create_tween()
		lights_tween.tween_property($Room, "modulate", Color("#fff"), $TurnTransitionTimer.wait_time)
	if day <= days.size() - 1:
		$TurnTransitionTimer.start()

func update_day_turn():
	var turn_with_offset = turn + 1
	var day_with_offset = day + 1
	player_stats.update_day_turn(day_with_offset, turn_with_offset)

func _on_start_game_pressed():
	$CanvasLayer2/StartGame.queue_free()
	$CanvasLayer2/PanelContainer.queue_free()
	$CanvasLayer2/PlayerStats.display_stats()
	new_turn()

func _on_card_selected(card):
	player_stats.set_stats(card)
	new_turn()

func _on_turn_transition_timer_timeout():
	new_draft()
	if current_draft:
		current_draft.connect_card_signals_to(_on_card_selected)
		turn += 1
	#Move to next day.
	if turn == 4:
		turn = 0
		day += 1
