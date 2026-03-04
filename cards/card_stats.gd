extends Resource
class_name CardStats

enum CARD_TYPE{
	work,
	leisure
}

@export var type: CARD_TYPE
@export var modifiers: Array[Modifier]
