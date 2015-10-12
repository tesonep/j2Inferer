types
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ ((aContext collect: [ :c | c superclass ]) select:#isNotNil) asSet