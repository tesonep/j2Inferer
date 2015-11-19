applying
returnTypeFor: message onContext: aContext alreadyEvaluated: anObject
	^ J2Type withClasses:(aContext collect: [ :e | inferer typeInfoFor: e analysedClass baseClass ])