as yet unclassified
runAndWait
	"Run all the pending tasks and all the generated lated  without returning the control"

	alreadyInQueue := Set new.
	runStart := Time microsecondClockValue.
	runTasks := 0.
	[ self hasTasks ] whileTrue: [ self runOne ]