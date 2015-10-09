as yet unclassified
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ (aContext collect: [ :c | c superclass ]) asSet