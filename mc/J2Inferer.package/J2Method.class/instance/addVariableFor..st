accessing
addVariableFor: aName
	^ temporaryVariables
		at: aName asSymbol
		ifAbsentPut: [ 
			J2Variable new
				variableName: aName asSymbol;
				inferer:inferer;
				container:self;
				yourself ]