*J2Inferer-Stats
instanceVariablesWithData
	^ self instanceVariables
		count: [ :v | 
			| ps |
			ps := v possibleClasses: (J2Context with:{self}).
			ps isNotNil and: [ ps isNotEmpty ] ]