as yet unclassified
addMessageSent: aMessageNode container: aContainer inferer: inferer receiver: rcvr parameters: params
	^ self
		addMessageSentTo: rcvr
		selector: aMessageNode selector
		parameters: params
		inferer: inferer
		container: aContainer.
