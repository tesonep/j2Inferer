as yet unclassified
runOne
	"Runs the first task in the queue."

	| currentTask speed |
	currentTask := self pickTaskToExecute.
	[ currentTask execute.]
		on: Error
		do: [ :e | self handleError: e onTask: currentTask ].
	runTasks := runTasks + 1.
	runTasks \\ 100 = 0
		ifTrue:
			[ 
			speed := (runTasks / (Time microsecondClockValue - runStart) * 1e6) asFloat.
			notifier pendingTasks: queue size speed: speed.
			Processor yield ]