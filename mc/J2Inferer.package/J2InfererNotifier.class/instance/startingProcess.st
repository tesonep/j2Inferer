events
startingProcess
	self openLogFile.
	startTime := DateAndTime now.
	self log:['Starting inferer process'] level:#info