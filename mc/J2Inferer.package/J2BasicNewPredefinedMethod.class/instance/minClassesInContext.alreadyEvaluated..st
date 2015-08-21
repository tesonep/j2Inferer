accessing
minClassesInContext: context alreadyEvaluated: alreadyEvaluated
	"self halt."

	^ context collect: [ :e | inferer typeInfoFor: e analysedClass baseClass ]