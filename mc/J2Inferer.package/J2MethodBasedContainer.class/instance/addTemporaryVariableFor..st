variables
addTemporaryVariableFor: aNode
	| aName |
	aName := aNode infererSource.
	^ temporaryVariables
		at: aName asSymbol
		ifAbsentPut: [ 
			(J2Variable newOnClass: self containerClass)
				variableName: aName asSymbol;
				yourself ]