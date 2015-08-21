as yet unclassified
variableFor: aName
	^ self parameterFor:aName ifAbsent:[self container variableFor: aName]