adding types
addSubtype: anotherVariable
	subtypes ifNil: [ subtypes := Set new ].
	subtypes add: anotherVariable.
	anotherVariable addSupertype: self.