as yet unclassified
checkIfHasManySubclasses: aBlock
	self analysedClass allSubclasses size > inferer config maxNumberSubclassesToOpen
		ifTrue: [ ^ #() ].
	^ aBlock value