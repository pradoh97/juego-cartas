extends Node

@export var conditions: Array[StatCondition]

func check_conditions(stats: Stats):
	for stat in stats.stat:
		var condition_index = conditions.find_custom(func(condition): return condition.modifier_type == stat.modifier.type)

		var condition_met: bool = false

		if condition_index > -1:
			var expression = Expression.new()
			var condition: StatCondition = conditions[condition_index]
			expression.parse(str(stat.amount) + condition.operator + str(condition.threshold))
			condition_met = expression.execute()
		print("Condition met? ", condition_met, " for: ", stat.modifier.icon, " with current value: ", stat.amount)
