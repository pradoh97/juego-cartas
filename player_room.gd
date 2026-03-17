extends Node2D
class_name PlayerRoom

@export var card_options_scene: PackedScene
@export var player_stats: PlayerStats
var turn: int = 0
var turn_type: CardStats.CARD_TYPE
var current_draft: CardOptions

func new_draft():
	var instance = card_options_scene.instantiate()
	instance.build_draft(turn_type)
	$CanvasLayer2.add_child(instance)
	current_draft = instance

func clear_draft():
	if current_draft:
		current_draft.queue_free()

func new_turn():
	clear_draft()
	turn += 1
	if turn == 1:
		turn_type = CardStats.CARD_TYPE.work
	if turn == 3:
		turn_type = CardStats.CARD_TYPE.leisure
	new_draft()
	current_draft.connect_card_signals_to(_on_card_selected)

func _on_start_game_pressed():
	$CanvasLayer2/StartGame.queue_free()
	$CanvasLayer2/PanelContainer.queue_free()
	new_turn()

func _on_card_selected(card_stats: CardStats):
	for modifier in card_stats.modifiers:
		if player_stats:
			player_stats.set_stat(modifier)
	new_turn()
