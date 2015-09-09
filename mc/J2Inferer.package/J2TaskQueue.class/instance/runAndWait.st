running
runAndWait
	"Run all the pending tasks and all the generated lated  without returning the control"
	notifier startingProcess.

	runStart := Time microsecondClockValue.
	runTasks := 0.
	[ self hasTasks ] whileTrue: [ self runOne ].

	notifier logStatistics.
	notifier endProcess.
