initialization
initialize
	config := Dictionary new.
	self initConfiguration.
	
	implementors := J2ImplementorsRegistry new.
	implementors fill.
	
	predefinedMessages := OrderedCollection new.
	
	classes := IdentityDictionary new.
	queue := J2TaskQueue new.
	notifier := J2InfererNotifier new
		inferer: self;
		yourself.
	queue notifier: notifier.
	literals := IdentityDictionary new.
	globals := IdentityDictionary new.
	
	self initPredefinedMessages.
