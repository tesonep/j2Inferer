test-code
recursiveMethod: aCondition
	aCondition ifTrue:[^ #aSymbol] ifFalse:[^ self recursiveMethod:aCondition].
	