accessing
initialize
	super initialize.
	elements := J2Variable new
		inferer: inferer;
		variableName: 'elements';
		yourself