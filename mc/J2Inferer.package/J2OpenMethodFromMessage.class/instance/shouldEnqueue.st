accessing
shouldEnqueue
	^ impls size <= (self inferer config maxNumberImplementorsToOpen)