initialization
initialize
	config := Dictionary new.
	self initConfiguration.
	
	predefinedMessages := OrderedCollection new.
	self initPredefinedMessages.
	
	classes := Dictionary new.
	queue := J2TaskQueue new.
	notifier := J2InfererNotifier new
		inferer: self;
		yourself.
	queue notifier: notifier.
	literals := Dictionary new.
	globals := Dictionary new.
	
	siRegister := J2SilentSIRegister new.