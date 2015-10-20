blocks
isBlockOn: aContext
	^ self isBlockOn: aContext alreadyEvaluated: IdentitySet new.