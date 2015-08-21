accesing type variables
variableFor: aName
	^globals at:aName ifAbsent:[literals at:aName].