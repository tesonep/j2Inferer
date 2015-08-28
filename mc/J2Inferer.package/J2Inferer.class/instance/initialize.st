initialization
initialize
	config := Dictionary new.
	self initConfiguration.
	
	predefinedMessages := OrderedCollection new.
	
	classes := IdentityDictionary new.
	queue := J2TaskQueue new.
	notifier := J2InfererNotifier new
		inferer: self;
		yourself.
	queue notifier: notifier.
	literals := IdentityDictionary new.
	globals := IdentityDictionary new.
	
	siRegister := J2SilentSIRegister new.
	self initPredefinedMessages.
