as yet unclassified
unionAll: anotherVariables name: aName container: aContainer inferer: inferer
	| var |
	var := self emptyOnClass: aContainer.
	var variableName: aName.
	anotherVariables do: [ :e | var addSubtype: e ].
	^ var