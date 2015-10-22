applying
returnTypeFor: message onContext: aContext alreadyEvaluated: alreadyEvaluated
	| blocks |
	blocks := message receiver blocksOn: aContext.
	^ blocks
		flatCollect:
			[ :e | e returnType minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated ]