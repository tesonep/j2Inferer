Extension { #name : #J2Class }

{ #category : #'*InfererBrowser' }
J2Class >> asIBModel [

	^ self asIBModelOnContext: nil
]

{ #category : #'*InfererBrowser' }
J2Class >> asIBModelOnContext: aContext [

	^ IBClass for: self on: aContext
]
