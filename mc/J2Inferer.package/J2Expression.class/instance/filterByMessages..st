accessing
filterByMessages: aCollection
	^ aCollection select: [ :c | self understandsAllMessages: c ]