accessing
filter: aCollection byMessages: messageSet
	^ aCollection select: [ :c | self understands:c allSelectors: messageSet ]