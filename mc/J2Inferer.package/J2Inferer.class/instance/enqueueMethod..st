tasks operations
enqueueMethod: aMethod
	| aJ2Class |
	aJ2Class := self typeInfoFor: aMethod methodClass.
	self enqueueMethod: aMethod onContext: {aJ2Class}.
