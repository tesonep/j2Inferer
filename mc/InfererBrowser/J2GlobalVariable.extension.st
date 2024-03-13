Extension { #name : #J2GlobalVariable }

{ #category : #'*InfererBrowser' }
J2GlobalVariable >> asIBModel: aContext [.
	^ IBGlobalVariable for: self on: aContext.
]

{ #category : #'*InfererBrowser' }
J2GlobalVariable >> asIBModelOnContext: aContext [

	^ IBGlobalVariable for: self on: aContext
]
