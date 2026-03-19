class_name CardOptions extends Resource

var cards: Array[Card] = []

func _init(new_cards: Array[Card] = []):
	cards = new_cards

func get_unused_cards(cards_to_filter: Array[Card] = cards) -> Array[Card]:
	return cards_to_filter.filter(func(card: Card): return not card.used)

func get_undisplayed_cards(cards_to_filter: Array[Card] = cards) -> Array[Card]:
	return cards_to_filter.filter(func(card: Card): return not (card.hide_if_shown and card.shown))

func get_available_cards() -> Array[Card]:
	return get_undisplayed_cards(get_unused_cards(cards))
