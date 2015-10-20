blocks
doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated
	| methods |
	methods := self methodsForReceivingContext: aContext.
	^ methods
		anySatisfy:
			[ :each | each returnType isBlockOn: aContext alreadyEvaluated: alreadyEvaluated ]