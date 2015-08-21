asserts
assert: typeVariable hasTemporaryVariable: aVariableName
	self assert: (typeVariable temporaryVariables at: aVariableName) isNotNil
		description: [ 'Variables: ' ,typeVariable temporaryVariables printString , ' not includes: ' , aVariableName  ]