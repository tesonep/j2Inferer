accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ self subtypes
		flatCollect:
			[ :e | e minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated ]