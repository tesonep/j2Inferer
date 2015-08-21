as yet unclassified
enqueue: aTask
	(self shouldEnqueue: aTask)
		ifTrue: [ 
			queue addLast: aTask.
			alreadyInQueue add: aTask.
		]