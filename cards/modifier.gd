extends Resource
class_name Modifier

enum MODIFIER_TYPE{
	obedience,
	money,
	morale,
	promotion_progress,
	expenses
}

@export var type: MODIFIER_TYPE
@export var icon: String = ""
@export var is_bounded: bool = true
