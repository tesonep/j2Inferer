accessing
methods
	| receiverContext |
	receiverContext := receiver minClassesInContext: self defaultContext alreadyEvaluated: IdentitySet new.
	^ self methodsOn: receiverContext