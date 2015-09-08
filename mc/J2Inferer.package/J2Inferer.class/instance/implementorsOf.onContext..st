implementors-queries
implementorsOf: aSelector onContext: aContext
	^ ((aContext collect: [ :each | each lookupSelector:aSelector ]) reject:#isNil) collect:[ :m | self methodVariableFor: m].
