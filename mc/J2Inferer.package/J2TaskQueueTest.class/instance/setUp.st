running
setUp
	super setUp.
	self taskQueue: J2TaskQueue new.
	self taskQueue notifier: J2TaskDoNothingNotifier new.
	numberOfSuccess := 0.
	numberOfFailures := 0.
	numberOfErrorHandled := 0.