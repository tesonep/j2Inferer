as yet unclassified
minClassesInContext: context alreadyEvaluated: alreadyEvaluated
	^ Number allSubclasses collect: [ :e | inferer typeInfoFor: e ]