extends CenterContainer
class_name UICard

var card: Card

signal card_selected(card: Card)

func build(new_card: Card):
	card = new_card
	card.mark_as_shown()
	$Text.text = card.text

func _on_button_pressed():
	card.mark_as_used()
	card_selected.emit(card)
