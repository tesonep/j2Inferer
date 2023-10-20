Extension { #name : #J2GlobalVariable }

{ #category : #'*InfererBrowser' }
J2GlobalVariable >> asIBModel: aContext [.
	^ IBGlobalVariable for: self on: aContext.
]
