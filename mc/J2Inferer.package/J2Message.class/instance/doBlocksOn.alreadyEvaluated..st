blocks
doBlocksOn: aContext alreadyEvaluated: alreadyEvaluated
	| methods |
	methods := self methodsForReceivingContext: aContext.
	^ methods
		flatCollect:
			[ :each | each returnValue blocksOn: aContext alreadyEvaluated: alreadyEvaluated ]