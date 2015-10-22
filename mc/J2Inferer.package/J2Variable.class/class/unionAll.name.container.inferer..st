as yet unclassified
unionAll: anotherVariables name: aName container: aContainer inferer: inferer
	| var |
	var := self empty.
	var variableName: aName.
	anotherVariables do: [ :e | var addSubtype: e ].
	^ var