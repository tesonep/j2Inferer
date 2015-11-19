accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	^ J2Type withClass:( self inferer typeInfoFor: BlockClosure )