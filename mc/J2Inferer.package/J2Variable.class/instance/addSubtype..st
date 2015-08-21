accessing
addSubtype: anotherVariable
	super addSubtype: anotherVariable.
	anotherVariable addSupertype: self.
	self checkMinClassesChange