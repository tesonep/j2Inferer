applying
returnTypeFor: message onContext: aContext alreadyEvaluated: anObject
	^ aContext collect: [ :e | inferer typeInfoFor: e analysedClass baseClass ]