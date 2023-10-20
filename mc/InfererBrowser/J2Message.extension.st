Extension { #name : #J2Message }

{ #category : #'*InfererBrowser' }
J2Message >> asIBModel: aContext [
	^IBMessage for: self on: aContext.
]
