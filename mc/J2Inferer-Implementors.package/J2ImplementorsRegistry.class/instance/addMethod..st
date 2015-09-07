as yet unclassified
addMethod: aMethod
	| x |
	x := self at:aMethod selector.
	x methods add:aMethod.