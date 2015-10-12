as yet unclassified
addMessageSentTo: receiver selector: selector parameters: parameters inferer: inferer container: container
	| msg |
	msg := self new.
	msg receiver: receiver.
	msg selector: selector.
	msg inferer: inferer.
	msg parameters: (parameters withIndexCollect:[ :e :i | J2ParameterVariable onMessage: msg index:i]) asArray.
	parameters withIndexDo: [ :e :i | (msg parameters at:i) buildRelationships: e container: container ].
	receiver addMessageSent: msg.
	inferer enqueueOpenMethodsFromMessage: msg.
	^ msg