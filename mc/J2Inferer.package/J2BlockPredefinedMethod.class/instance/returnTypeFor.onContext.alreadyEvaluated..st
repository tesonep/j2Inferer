applying
returnTypeFor: message onContext: aContext alreadyEvaluated: alreadyEvaluated
	| blocks returnType |
	blocks := message receiver blocksOn: aContext.
	returnType := J2Type empty.
	blocks do:
			[ :e | returnType union:(e returnValue minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) ].
	^ returnType