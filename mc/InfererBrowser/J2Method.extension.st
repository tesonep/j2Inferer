Extension { #name : #J2Method }

{ #category : #'*InfererBrowser' }
J2Method >> asIBModel [

	^ self asIBModelOnContext: nil
]

{ #category : #'*InfererBrowser' }
J2Method >> asIBModelOnContext: aContext [

	^ IBMethod for: self on: aContext
]
