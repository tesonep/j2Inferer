initialization
fillReturn
	returnType := J2Variable new
		variableName: '^';
		container: self;
		inferer: inferer;
		yourself