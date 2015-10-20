blocks
doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated
	^ self subtypes
		anySatisfy:
			[ :each | each isBlockOn: aContext alreadyEvaluated: alreadyEvaluated ]