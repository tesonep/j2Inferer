stats
averageParametersWithData
	self parameters isZero ifTrue: [ ^0 ].
	^ self parametersWithData / self parameters.