accesing type variables
variableFor: aName ifAbsent: aValuable
	^globals at:aName ifAbsent:[literals at:aName ifAbsent: aValuable].