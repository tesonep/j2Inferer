adding types
addMessageSent: msg
	selectors ifNil:[selectors := IdentitySet new].
	selectors add: msg selector.
