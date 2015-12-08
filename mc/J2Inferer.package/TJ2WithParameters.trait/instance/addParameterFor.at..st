accessing
addParameterFor: aName at: index
	self parameters at: index put: ((J2Variable newOnClass: self classTypeInfo)
						variableName: aName asSymbol;
						yourself).