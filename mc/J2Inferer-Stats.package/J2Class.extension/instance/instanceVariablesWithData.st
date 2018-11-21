*J2Inferer-Stats
instanceVariablesWithData
	^ self instanceVariables
		count: [ :v | 
			| ps |
			ps := v possibleClassesInContext: (J2Context with:{self}).
			ps isNotNil and: [ ps isNotEmpty ] ]