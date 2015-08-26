comparing
compareToOpenMethodTask: anotherTask
	^ method = anotherTask method
		and: [ anotherTask context includesAll: context ]