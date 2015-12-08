*J2Inferer-Stats
hasSupertypeOfOtherClass
	^ self supertypes anySatisfy: [ :e | 
		e classTypeInfo isNotNil and: [e classTypeInfo ~= self classTypeInfo] ].