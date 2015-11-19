*J2Inferer-Stats
returnTypesWithData
	^ self methods count:
			[ :v | | ps |
				ps := v returnValue possibleClasses: (J2Context with:{self}).
				ps isNotNil and: [ ps isNotEmpty ] ]