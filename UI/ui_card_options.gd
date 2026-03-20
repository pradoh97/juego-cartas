class_name UICardOptions extends HBoxContainer

@export var card_scene: PackedScene
var cards: Array[Card]

func _ready():
	for card_index in cards.size():
		var ui_card: UICard = card_scene.instantiate()
		ui_card.build(cards[card_index])
		add_child(ui_card)

func set_cards(new_cards: Array[Card]):
	cards = new_cards.duplicate()

func connect_card_signals_to(method: Callable):
	for card in get_children():
		card = card as UICard
		card.card_selected.connect(method)
