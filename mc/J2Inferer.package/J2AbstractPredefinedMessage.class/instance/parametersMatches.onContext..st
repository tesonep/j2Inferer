testing if can handle
parametersMatches: aMessage onContext: aContext
	parameters size = aMessage parameters size
		ifFalse: [ ^ false ].
	^ true