as yet unclassified
addMessageSent: aMessageNode container: container inferer: inferer receiver: receiver parameters: parameters
	| msg |
	msg := aMessageNode isSuperSend 
		ifTrue:[J2SuperMessage newOnClass: container containerClass] 
		ifFalse:[self newOnClass: container containerClass] .
		
	msg receiver: receiver.
	msg selector: aMessageNode selector.
	msg parameters: (parameters withIndexCollect:[ :e :i | J2ParameterVariable onMessage: msg index:i]) asArray.
	msg containerClass: container containerClass.
	
	parameters withIndexDo: [ :e :i | (msg parameters at:i) buildRelationships: e container: container ].
	receiver addMessageSent: msg.
	inferer enqueueOpenMethodsFromMessage: msg.
	^ msg