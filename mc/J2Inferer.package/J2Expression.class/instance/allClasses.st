accessing
allClasses
	^ RBBrowserEnvironment default allClasses collect:[:c | inferer typeInfoFor:c].