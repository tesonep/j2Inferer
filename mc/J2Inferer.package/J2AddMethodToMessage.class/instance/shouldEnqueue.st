accessing
shouldEnqueue
	^ self methodVariables anySatisfy: [ :e | (message hasMethod: e) not ]
