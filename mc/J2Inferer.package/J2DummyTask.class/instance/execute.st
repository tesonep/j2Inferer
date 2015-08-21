accessing
execute
	shouldFail
		ifTrue: [ 
			self test reportFailure.
			self error: 'I should fail :(' ]
		ifFalse: [ self test reportSuccess ]