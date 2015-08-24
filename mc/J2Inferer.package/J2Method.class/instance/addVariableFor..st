accessing
addVariableFor: aName
	^ temporaryVariables
		at: aName
		ifAbsentPut: [ 
			J2Variable new
				variableName: aName;
				inferer:inferer;
				container:self;
				yourself ]