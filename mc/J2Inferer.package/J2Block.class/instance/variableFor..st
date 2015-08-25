as yet unclassified
variableFor: aNode
	^ self parameterFor: aNode infererSource ifAbsent:[self container variableFor: aNode]