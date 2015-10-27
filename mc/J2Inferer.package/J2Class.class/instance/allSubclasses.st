as yet unclassified
allSubclasses
	^self checkIfHasManySubclasses:[
		self analysedClass allSubclasses collect: [ :c | self inferer typeInfoFor: c ]
	]