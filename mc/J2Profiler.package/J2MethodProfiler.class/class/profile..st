as yet unclassified
profile: aMethod
	| w |
	(aMethod isKindOf: J2MethodProfiler)
		ifTrue: [ ^ aMethod ].
	w := self new.
	w method: aMethod.
	aMethod methodClass addSelector: aMethod selector withMethod: w.
	^ w