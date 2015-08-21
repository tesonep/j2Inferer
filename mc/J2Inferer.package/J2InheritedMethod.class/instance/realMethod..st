accessing
realMethod: anObject
	realMethod := anObject.
	returnType := J2Variable new
		variableName: '^';
		container: self;
		inferer:self inferer;
		addSubtype: realMethod returnType;
		yourself