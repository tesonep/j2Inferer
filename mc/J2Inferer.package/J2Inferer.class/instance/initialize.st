initialization
initialize
	config := Dictionary new.
	self initConfiguration.
	
	predefinedMessages := OrderedCollection new.
	
	classes := IdentityDictionary new.
	queue := J2TaskQueue new.
	literals := IdentityDictionary new.
	globals := IdentityDictionary new.
	arrayLiterals := Set new.
