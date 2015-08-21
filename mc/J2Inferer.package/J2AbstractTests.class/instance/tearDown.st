asserts
tearDown
	super tearDown.
	inferer notifier logStatistics.
	inferer notifier logClasses.