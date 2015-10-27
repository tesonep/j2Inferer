variables
addTemporaryVariableFor: aNode
	| aName |
	aName := aNode infererSource.
	^ temporaryVariables
		at: aName asSymbol
		ifAbsentPut: [ 
			J2Variable new
				variableName: aName asSymbol;
				yourself ]