as yet unclassified
checkIfHasManySubclasses: aBlock
	self analysedClass allSubclasses size > (inferer config at:#maxNumberSubclassesToOpen) ifTrue:[^#()].
	^ aBlock value.