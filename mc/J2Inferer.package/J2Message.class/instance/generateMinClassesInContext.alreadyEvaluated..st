accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ self methods
		flatCollect:
			[ :e | 
			e returnType
				minClassesInContext: (receiver minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated)
				alreadyEvaluated: alreadyEvaluated ]