methods
addVariableFor: aName
	instanceVariables ifNil:[instanceVariables := IdentityDictionary new].

	^instanceVariables
		at: aName asSymbol 
		ifAbsentPut: [ 
			J2Variable new
				variableName: aName;
				container: self;
				inferer: self inferer;
				yourself ]