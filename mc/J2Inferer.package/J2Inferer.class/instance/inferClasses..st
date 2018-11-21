infering
inferClasses: aBunch
	aBunch do:[:aClass | self enqueueClass: aClass].
	self runAndWait.
	