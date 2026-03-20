class_name GameOver extends Event

func execute(context: Context):
	context.player_room.trigger_game_over(cards)
