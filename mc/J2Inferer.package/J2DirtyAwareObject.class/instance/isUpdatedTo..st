as yet unclassified
isUpdatedTo: another
	^ timestamp ifNil: true ifNotNil:[
			timestamp < another timestamp.
		]