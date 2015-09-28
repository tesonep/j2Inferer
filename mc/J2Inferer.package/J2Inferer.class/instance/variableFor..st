accesing type variables
variableFor: aNode
	^ self variableFor: aNode ifAbsent: [ self error: 'Undefined expression:' , aNode ]