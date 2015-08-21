comparing
compareToOpenMethodTask: anotherTask
	^ (method = anotherTask method
		and: [ subject = anotherTask subject ])
		and: [ context = anotherTask context ]