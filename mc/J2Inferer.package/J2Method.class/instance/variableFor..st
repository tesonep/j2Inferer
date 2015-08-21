accessing
variableFor: aName
	^ self parameterFor:aName ifAbsent:[temporaryVariables at: aName ifAbsent: [ self classTypeInfo variableFor: aName ]]