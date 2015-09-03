as yet unclassified
initialize
	super initialize.
	parameters := {(J2Variable new
		variableName: 'parameter1';
		container: self;
		inferer: self inferer;
		yourself)}