accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ methods
		flatCollect:
			[ :e | 
			e returnType
				minClassesInContext: (receiver minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated)
				alreadyEvaluated: alreadyEvaluated ]