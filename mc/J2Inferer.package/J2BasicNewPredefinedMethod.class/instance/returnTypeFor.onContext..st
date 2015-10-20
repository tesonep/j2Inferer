applying
returnTypeFor: message onContext: aContext
	^ aContext collect: [ :e | inferer typeInfoFor: e analysedClass baseClass ]