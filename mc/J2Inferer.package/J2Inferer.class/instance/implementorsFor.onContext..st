implementors-queries
implementorsFor: aMessage onContext: aContext
	^ ((aContext contents collect: [ :each | each lookupSelector: aMessage selector ]) reject: #isNil)
		collect: [ :m | self methodVariableFor: m ]