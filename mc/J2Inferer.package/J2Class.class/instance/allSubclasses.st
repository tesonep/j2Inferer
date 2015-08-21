as yet unclassified
allSubclasses
	^self checkIfHasManySubclasses:[
		self analysedClass allSubclasses collect: [ :c | inferer typeInfoFor: c ]
	]