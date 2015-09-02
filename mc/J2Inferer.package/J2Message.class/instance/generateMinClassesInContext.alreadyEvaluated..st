accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| receiverContext |
	receiverContext := receiver minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated.
	
	^ (self methodsOn: receiverContext)
		flatCollect:
			[ :e | 
			e returnType
				minClassesInContext: receiverContext 
				alreadyEvaluated: alreadyEvaluated ]