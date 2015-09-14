accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self selectors .