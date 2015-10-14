running
setUp
	super setUp.
	inferer := J2Inferer new.
	astContainers := IdentityDictionary new.
	inferer registerASTContainerListener: self.
	inferer initWithNotifier: J2NullNotifier new.
	
