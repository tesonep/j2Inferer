as yet unclassified
shouldEnqueue: aTask
	^ aTask shouldEnqueue and:[ (inQueue includes: aTask) not ].