as yet unclassified
subclasses
	^ self analysedClass subclasses collect:[:e | self inferer typeInfoFor: e].