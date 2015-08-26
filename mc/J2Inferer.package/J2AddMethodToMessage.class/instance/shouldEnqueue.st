accessing
shouldEnqueue
	^ (message hasMethod: self methodVariable) not