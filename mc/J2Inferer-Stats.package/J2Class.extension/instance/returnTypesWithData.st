*J2Inferer-Stats
returnTypesWithData
	^ self methods count:
			[ :v | | ps |
				ps := v returnType possibleClasses.
				ps isNotNil and: [ ps isNotEmpty ] ]