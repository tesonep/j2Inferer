stats
averageInstanceVariablesWithData
	self instanceVariables isZero ifTrue: [ ^0 ].
	^ self instanceVariablesWithData / self instanceVariables 