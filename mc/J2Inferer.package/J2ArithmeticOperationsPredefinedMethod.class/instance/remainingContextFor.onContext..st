initialization
remainingContextFor: aMessage onContext: aContext
	^ J2Context with: (aContext contents difference: implementingClasses)