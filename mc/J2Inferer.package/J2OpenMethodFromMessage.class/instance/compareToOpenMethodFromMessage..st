comparing
compareToOpenMethodFromMessage: anotherTask
	^ message = anotherTask message and:[anotherTask receivers includesAll: receivers]