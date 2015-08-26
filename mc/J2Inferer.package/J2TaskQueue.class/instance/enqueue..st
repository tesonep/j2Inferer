enqueuing
enqueue: aTask
	"The task knows if has to be enqueue in the queue. Maybe there is nothing to do."
	(self shouldEnqueue: aTask)
		ifTrue:
			[  "If a equal task is found then it has to be merged, if not it's added to the queue" 
				self merge: aTask orDo:
					[ 
					(queue at: aTask runLevel) addLast: aTask.
					(inQueue at: aTask runLevel) add: aTask ] ]