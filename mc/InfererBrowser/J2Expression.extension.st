Extension { #name : #J2Expression }

{ #category : #'*InfererBrowser' }
J2Expression >> asIBModel [

	^ self asIBModelOnContext: nil
]

{ #category : #'*InfererBrowser' }
J2Expression >> asIBModelOnContext: aContext [

	^ IBExpression for: self on: aContext
]
