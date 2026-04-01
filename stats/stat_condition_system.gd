extends Node

@export var conditions: Array[StatCondition]
var context: Context = Context.new()

func event_conditions_met(stats: StatsCollection) -> Array[StatCondition]:
	var conditions_met: Array[StatCondition] = []

	for stat in stats.stats:
		var conditions_found = conditions.filter(func(condition): return condition.modifier_type == stat.modifier.type)
		conditions_met.append_array(get_conditions_met(conditions_found, stat))

	return conditions_met

func get_conditions_met(conditions_to_evaluate: Array[StatCondition], stat: Stat):
	var conditions_met: Array[StatCondition] = []
	for condition in conditions_to_evaluate:
		var expression = Expression.new()
		expression.parse(str(stat.amount) + condition.operator + str(condition.threshold))
		var condition_met = expression.execute()
		if condition_met:
			conditions_met.append(condition)
	return conditions_met

func execute_condition_event(conditions_to_execute: Array[StatCondition]):
	for condition in conditions_to_execute:
		condition.event_to_trigger.execute(context)
