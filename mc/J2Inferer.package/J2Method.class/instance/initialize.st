initialization
initialize
	super initialize.
	returnType := J2Variable new
		variableName: '^';
		container: self;
		inferer:inferer;
		yourself.
	temporaryVariables := Dictionary new.
	innerExpressions := Dictionary new.
	parameters := OrderedCollection new.
	stamp := 0