Extension { #name : #J2Expression }

{ #category : #'*J2Inferer-Stats' }
J2Expression >> hasSupertypeOfOtherClass [
	^ self supertypes anySatisfy: [ :e | 
		e classTypeInfo isNotNil and: [e classTypeInfo ~= self classTypeInfo] ].
]
