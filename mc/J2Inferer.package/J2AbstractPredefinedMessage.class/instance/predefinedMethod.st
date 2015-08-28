initialization
predefinedMethod
	^ predefinedMethod ifNil: [ ^ predefinedMethod := self createPredefinedMethod ]