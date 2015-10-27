as yet unclassified
checkIfHasManySubclasses: aBlock
	self analysedClass allSubclasses size > self inferer config maxNumberSubclassesToOpen
		ifTrue: [ ^ #() ].
	^ aBlock value