extends PanelContainer

var reason: String = ""

func _ready():
	%Reason.text = reason
	%NewGame.disabled = true
	%NewGame.modulate = Color(0.0, 0.0, 0.0, 0.0)
	$Timer.start()

func connect_signal(callable: Callable):
	%NewGame.pressed.connect(callable)

func set_reason(new_reason: String):
	reason = new_reason


func _on_timer_timeout():
	%NewGame.disabled = false
	var tween = create_tween()
	tween.tween_property(%NewGame, "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.5)
