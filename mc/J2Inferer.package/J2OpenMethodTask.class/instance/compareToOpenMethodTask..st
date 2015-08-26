comparing
compareToOpenMethodTask: anotherTask
	^ method = anotherTask method
		and: [ context = anotherTask context ]