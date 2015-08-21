initialization
predefinedMethod
	^ predefinedMethod ifNil:[
			^predefinedMethod := J2BasicNewPredefinedMethod new
		inferer: inferer;
		yourself
		
		]