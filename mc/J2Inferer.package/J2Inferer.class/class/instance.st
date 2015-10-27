accessing
instance
	^ instance ifNil:[ instance := self default ]