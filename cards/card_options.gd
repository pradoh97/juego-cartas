extends HBoxContainer
class_name CardOptions

@export_category("Work cards")
@export var work_cards: Array[CardOption]
var available_work_cards: Array[CardStats]
@export_category("Leisure cards")
@export var leisure_cards: Array[CardOption]
var available_leisure_cards: Array[CardStats]

func build_draft(turn_type: CardStats.CARD_TYPE):
	for card in work_cards:
		for amount in card.available:
			available_work_cards.append(card.stats)
	for card in leisure_cards:
		for amount in card.available:
			available_leisure_cards.append(card.stats)
	if turn_type == CardStats.CARD_TYPE.work:
		$Card.stats = available_work_cards.pop_at(randi_range(0, available_work_cards.size()-1))
		$Card2.stats = available_work_cards.pop_at(randi_range(0, available_work_cards.size()-1))
		$Card3.stats = available_work_cards.pop_at(randi_range(0, available_work_cards.size()-1))
	if turn_type == CardStats.CARD_TYPE.leisure:
		$Card.stats = available_leisure_cards.pop_at(randi_range(0, available_leisure_cards.size()-1))
		$Card2.stats = available_leisure_cards.pop_at(randi_range(0, available_leisure_cards.size()-1))
		$Card3.stats = available_leisure_cards.pop_at(randi_range(0, available_leisure_cards.size()-1))

func connect_card_signals_to(method: Callable):
	for card in get_children():
		(card as Card).card_selected.connect(method)
