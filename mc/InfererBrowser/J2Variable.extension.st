Extension { #name : #J2Variable }

{ #category : #'*InfererBrowser' }
J2Variable >> asIBModel: aContext [
	^ IBVariable for: self on: aContext.
]
