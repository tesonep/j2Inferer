accessing
variableFor: aNode
	| aName |
	aName := aNode infererSource.
	^ self
		parameterFor: aName
		ifAbsent:
			[ temporaryVariables at: aName asSymbol ifAbsent: [ self classTypeInfo variableFor: aNode ] ]