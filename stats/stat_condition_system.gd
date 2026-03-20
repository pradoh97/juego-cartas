extends Node

@export var conditions: Array[StatCondition]
var context: Context = Context.new()

func event_conditions_met(stats: StatsCollection) -> bool:
	var conditions_met: Array = []
	for stat in stats.stats:
		var condition_index = conditions.find_custom(func(condition): return condition.modifier_type == stat.modifier.type)
		var condition_met: bool = false
		if condition_index > -1:
			var expression = Expression.new()
			var condition: StatCondition = conditions[condition_index]
			expression.parse(str(stat.amount) + condition.operator + str(condition.threshold))
			condition_met = expression.execute()
		if condition_met:
			conditions_met.append(conditions[condition_index])
			conditions[condition_index].event_to_trigger.execute(context)
	return conditions_met.size()
