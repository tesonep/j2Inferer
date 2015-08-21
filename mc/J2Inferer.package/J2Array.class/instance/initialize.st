accessing
initialize
	super initialize.
	elements := J2Variable new
		container: self;
		inferer: inferer;
		yourself