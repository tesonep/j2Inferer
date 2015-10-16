applying
returnTypeOnContext: aContext
	^ aContext collect: [ :e | inferer typeInfoFor: e analysedClass baseClass ]