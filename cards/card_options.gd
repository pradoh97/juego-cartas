class_name CardOptions extends HBoxContainer

var cards: Array[Card]

func _ready():
	for card_index in cards.size():
		var ui_card: UICard = get_child(card_index)
		ui_card.build(cards[card_index])

func set_cards(new_cards: Array[Card]):
	cards = new_cards.duplicate()

func connect_card_signals_to(method: Callable):
	for card in get_children():
		(card as UICard).card_selected.connect(method)
