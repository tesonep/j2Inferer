methods
addVariableFor: aName
	instanceVariables
		at: aName
		ifAbsentPut: [ 
			J2Variable new
				variableName: aName;
				container: self;
				inferer: self inferer;
				yourself ]