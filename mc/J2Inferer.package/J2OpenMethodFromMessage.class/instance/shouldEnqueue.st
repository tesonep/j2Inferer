accessing
shouldEnqueue
	^ receivers 
		ifEmpty: [ impls size <= (self inferer config at: #maxNumberImplementorsToOpen) ] 
		ifNotEmpty: [ true ]