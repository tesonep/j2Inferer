variables
variableFor: aNode
	| aName |
	aName := aNode infererSource.
	^ element parameterFor: aName
		ifAbsent:
			[ temporaryVariables at: aName asSymbol ifAbsent: [ parent variableFor: aNode ] ]