as yet unclassified
isUpdatedToAll: aCollection
	^ aCollection allSatisfy: [ :e | self isUpdatedTo: e ].