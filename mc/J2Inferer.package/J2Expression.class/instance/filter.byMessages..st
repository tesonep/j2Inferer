accessing
filter: aCollection byMessages: messageSet
	^ aCollection select: [ :c | self understands:c allMessages: messageSet ]