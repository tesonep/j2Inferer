as yet unclassified
addMessageSent: aMessageNode container: container inferer: inferer receiver: receiver parameters: parameters
	| msg |
	msg := aMessageNode isSuperSend ifTrue:[J2SuperMessage new] ifFalse:[self new] .
	msg receiver: receiver.
	msg selector: aMessageNode selector.
	msg inferer: inferer.
	msg parameters: (parameters withIndexCollect:[ :e :i | J2ParameterVariable onMessage: msg index:i]) asArray.
	parameters withIndexDo: [ :e :i | (msg parameters at:i) buildRelationships: e container: container ].
	receiver addMessageSent: msg.
	inferer enqueueOpenMethodsFromMessage: msg.
	^ msg