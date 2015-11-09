adding types
addMessageSent: msg
	messages ifNil:[messages := IdentitySet new].
	messages add: msg.
