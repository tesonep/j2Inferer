as yet unclassified
distanceToTop
	^ superclass ifNil:[ 0 ] ifNotNil: [ 1 + superclass distanceToTop ]
		 