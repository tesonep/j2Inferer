accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| receiverType remainingContext receiverContext resultType|
	receiverType := receiver minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated.
	receiverContext := J2Context with: receiverType minClasses.

	remainingContext := J2Context with: receiverType minClasses.

	resultType := J2Type empty.	

	self inferer predefinedMessages
		detect: [ :each | each canHandle: self onContext: receiverContext ]
		ifFound:
			[ :found | 
			remainingContext := found remainingContextFor: self onContext: receiverContext.
			resultType union: (found returnTypeFor: self onContext: receiverContext contents alreadyEvaluated: alreadyEvaluated) ].
	
		
	(self methodsOn: remainingContext)
			do: [ :e | resultType union:(e returnValue minClassesInContext: remainingContext alreadyEvaluated: alreadyEvaluated) ].

	^ resultType