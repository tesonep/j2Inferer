initialize
fillReturn
	returnValue := (J2Variable newOnClass: self classTypeInfo )
		variableName: '^';
		yourself