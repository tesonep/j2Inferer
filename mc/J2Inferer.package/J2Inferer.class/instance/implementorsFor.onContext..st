implementors-queries
implementorsFor: aMessage onContext: aContext
	^ ((aContext collect: [ :each | each lookupSelector: aMessage selector ]) reject: #isNil)
		collect: [ :m | self methodVariableFor: m ]