accessing
union: anotherVariable
	^ J2Variable empty
		addSubtype: self;
		addSubtype: anotherVariable;
		container: self container;
		inferer: inferer;
		yourself