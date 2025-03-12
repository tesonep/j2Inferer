Extension { #name : #J2Class }

{ #category : #'*J2Inferer-Stats' }
J2Class >> blockInstanceVariables [
	^ self instanceVariables
		count: [ :v | v isBlockOn: {self} ]
]

{ #category : #'*J2Inferer-Stats' }
J2Class >> blockReturnTypes [
	^ self methods count: [ :v | v returnValue isBlockOn:{self} ]
]

{ #category : #'*J2Inferer-Stats' }
J2Class >> instanceVariablesWithData [
	^ self instanceVariables
		count: [ :v | 
			| ps |
			ps := v possibleClassesInContext: (J2Context with:{self}).
			ps isNotNil and: [ ps isNotEmpty ] ]
]

{ #category : #'*J2Inferer-Stats' }
J2Class >> returnTypesWithData [
	^ self methods count:
			[ :v | | ps |
				ps := v returnValue possibleClassesInContext: (J2Context with:{self}).
				ps isNotNil and: [ ps isNotEmpty ] ]
]
