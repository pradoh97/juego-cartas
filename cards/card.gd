extends CenterContainer
class_name Card

@export var stats: CardStats

signal card_selected(stats: CardStats)

func _ready():
	match stats.type:
		CardStats.CARD_TYPE.work:
			%CardType.text = "Work"
		CardStats.CARD_TYPE.leisure:
			%CardType.text = "Leisure"

	for modifier in stats.modifiers:
		var amount_hint

		if modifier.amount > 0:
			amount_hint = "+".repeat(modifier.amount)
		if modifier.amount < 0:
			amount_hint = "-".repeat(abs(modifier.amount))

		match modifier.type:
			Modifier.MODIFIER_TYPE.obedience:
				%Obedience.text = amount_hint + "🤝"
			Modifier.MODIFIER_TYPE.money:
				%Money.text = amount_hint + "💰"
			Modifier.MODIFIER_TYPE.morale:
				%Morale.text = amount_hint + "🧠"
			Modifier.MODIFIER_TYPE.promotion_progress:
				%PromotionProgress.text = amount_hint + "💼"
			Modifier.MODIFIER_TYPE.expenses:
				%Expenses.text = amount_hint + "💳"


func _on_button_pressed():
	card_selected.emit(stats)
