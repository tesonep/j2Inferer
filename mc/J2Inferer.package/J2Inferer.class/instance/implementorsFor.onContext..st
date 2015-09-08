implementors-queries
implementorsFor: aMessage onContext: aContext
	| remainingContext methodAndRemaining predefinedMethods |
	methodAndRemaining := self methodToApplyAndRemainingContext: aMessage onContext: aContext.
	predefinedMethods := methodAndRemaining first.
	remainingContext := methodAndRemaining second.

	^ (self implementorsOf:aMessage selector onContext:remainingContext) , predefinedMethods