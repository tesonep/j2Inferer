enqueuing
shouldEnqueue: aTask
	^ aTask shouldEnqueue and:[ (self isInQueue: aTask) not ].