*J2Inferer-Stats
instanceVariablesWithData
	^ self instanceVariables
		count: [ :v | 
			| ps |
			ps := v possibleClasses.
			ps isNotNil and: [ ps isNotEmpty ] ]