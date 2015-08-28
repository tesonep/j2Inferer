accessing
minClassesInContext: context alreadyEvaluated: alreadyEvaluated
	^ context collect: [ :e | inferer typeInfoFor: e analysedClass baseClass ]