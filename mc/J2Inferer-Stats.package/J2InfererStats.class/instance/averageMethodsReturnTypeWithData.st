stats
averageMethodsReturnTypeWithData
	self methods isZero ifTrue: [ ^0 ].
	^ self methodsReturnTypeWithData / self methods 