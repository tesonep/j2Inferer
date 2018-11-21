accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated

	"I propagate the evaluateion to the actual parameter in the block"
	
	^ (self block parameters at: index) minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated