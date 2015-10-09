accessing
addParameterFor: aName at: index
	self parameters at: index put: (J2Variable new
						variableName: aName asSymbol;
						container: self;
						inferer: self inferer
						yourself).