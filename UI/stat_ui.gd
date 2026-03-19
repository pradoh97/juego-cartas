extends HBoxContainer
class_name StatUI

var modifier_is_bounded = false

func initialize(modifier: Modifier):
	modifier_is_bounded = modifier.is_bounded
	if not modifier_is_bounded:
		$ProgressBar.queue_free()
		$Value.visible = true
	else:
		$Value.queue_free()
		$ProgressBar.visible = true
	$Icon.text = modifier.icon


func set_value(new_value: int, no_transition=false):
	if modifier_is_bounded:
		if no_transition:
			$ProgressBar.value = new_value
		else:
			var tween = create_tween()
			tween.tween_property($ProgressBar, "value", new_value, 0.1)
	else:
		$Value.text = str(new_value)
