accesing type variables
variableFor: aName
	^self variableFor: aName ifAbsent: [ self error: 'Undefined expression:', aName ].