initialization
applyTo: aMessage onContext: aContext
	aMessage methodOpened: self predefinedMethod.
	^ (aMessage receiver minClassesInContext:aContext) difference: implementingClasses