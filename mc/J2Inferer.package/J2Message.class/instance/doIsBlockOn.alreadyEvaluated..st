blocks
doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated
	| methods |
	methods := self methodsForReceivingContext: aContext.
	^ methods
		anySatisfy:
			[ :each | each returnValue isBlockOn: aContext alreadyEvaluated: alreadyEvaluated ]