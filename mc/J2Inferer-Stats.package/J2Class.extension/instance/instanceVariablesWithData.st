*J2Inferer-Stats
instanceVariablesWithData
	^ self instanceVariables
		count: [ :v | 
			| ps |
			ps := v possibleClasses: {self}.
			ps isNotNil and: [ ps isNotEmpty ] ]