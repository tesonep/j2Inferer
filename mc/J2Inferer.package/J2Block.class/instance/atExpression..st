as yet unclassified
atExpression: aNode
	^self parameterFor: aNode infererSource ifAbsent: [ self container atExpression: aNode ]