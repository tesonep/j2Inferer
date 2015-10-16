accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| receiverContext remainingContext results |
	receiverContext := receiver minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated.
	results := Set new.
	remainingContext := receiverContext.
	
	self inferer predefinedMessages 
		detect:[:each | each canHandle: self onContext: receiverContext] 
		ifFound: [ :found | 
						remainingContext := found remainingContextFor: self onContext: receiverContext.
						results addAll: (found returnTypeOnContext: receiverContext).
					].
		
	results addAll:( (self methodsOn: remainingContext)
		flatCollect:
			[ :e | 
			e returnType
				minClassesInContext: remainingContext 
				alreadyEvaluated: alreadyEvaluated ]).
			
	^ results.