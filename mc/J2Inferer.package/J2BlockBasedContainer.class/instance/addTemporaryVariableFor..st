variables
addTemporaryVariableFor: aNode
	| aName |
	aName := aNode infererSource.
	^ (self hasTemporaryVariable: aName)
		ifTrue: [ self variableFor: aNode ]
		ifFalse:
			[ 
				^ temporaryVariables
				at: aName asSymbol
				put:
					(J2Variable new
						variableName: aName asSymbol;
						yourself) ]