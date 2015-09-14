accessing
shouldEnqueue
	^ impls size <= (self inferer config at: #maxNumberImplementorsToOpen)