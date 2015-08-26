private
findInQueue: aTask
	| s |
	s := inQueue at: aTask runLevel.
	^s array at: (s scanFor: aTask).
	