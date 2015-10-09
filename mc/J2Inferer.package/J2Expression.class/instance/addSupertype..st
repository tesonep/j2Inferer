adding types
addSupertype: anotherVariable.
	supertypes ifNil:[ supertypes := Set new].
	supertypes add: anotherVariable.
