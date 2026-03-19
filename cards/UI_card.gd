extends CenterContainer
class_name UICard

var card: Card

signal card_selected(card: Card)

func build(new_card: Card):
	card = new_card
	$Text.text = card.text

func _on_button_pressed():
	card_selected.emit(card)
