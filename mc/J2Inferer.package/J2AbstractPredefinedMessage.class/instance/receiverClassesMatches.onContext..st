testing if can handle
receiverClassesMatches: aMessage onContext: aContext
	^ implementingClasses isEmpty or: [
		(aMessage receiver minClassesInContext:aContext) includesAny: implementingClasses].