as yet unclassified
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ (aContext collect: [ :c | c superclass ]) asSet