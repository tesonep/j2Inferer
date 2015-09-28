asserts
assert: typeVariable hasTemporaryVariable: aVariableName
	| container | 
	container := self containerFor: typeVariable.
	self assert: (container temporaryVariables at: aVariableName) isNotNil
		description: [ 'Variables: ' ,typeVariable temporaryVariables printString , ' not includes: ' , aVariableName  ]