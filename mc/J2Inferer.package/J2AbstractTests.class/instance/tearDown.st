asserts
tearDown
	super tearDown.
	inferer notifier logClasses.
	inferer notifier close.
	