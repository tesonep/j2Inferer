infering
inferClasses: aBunch
	aBunch do:[:aClass | inferer enqueueClass: aClass].
	inferer runAndWait.