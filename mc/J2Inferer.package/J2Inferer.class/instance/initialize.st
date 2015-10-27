initialization
initialize
	config := J2InfererConfig new.
	
	predefinedMessages := OrderedCollection new.
	
	classes := IdentityDictionary new.
	queue := J2TaskQueue new.
	literals := IdentityDictionary new.
	globals := IdentityDictionary new.
	arrayLiterals := Set new.

	notifier inferer: self.
	queue notifier: notifier.

	self initPredefinedMessages
