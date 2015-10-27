running
setUp
	super setUp.
	astContainers := IdentityDictionary new.
	inferer := J2Inferer default.
	inferer registerASTContainerListener: self.
	
	
