*J2Inferer-Stats
returnTypesWithData
	^ self methods count:
			[ :v | | ps |
				ps := v returnType possibleClasses:{self}.
				ps isNotNil and: [ ps isNotEmpty ] ]