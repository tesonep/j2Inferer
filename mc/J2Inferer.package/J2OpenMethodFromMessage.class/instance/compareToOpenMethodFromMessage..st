comparing
compareToOpenMethodFromMessage: anotherTask
	^ (message = anotherTask message and: [ anotherTask context = context ]) and:[receivers = anotherTask receivers]