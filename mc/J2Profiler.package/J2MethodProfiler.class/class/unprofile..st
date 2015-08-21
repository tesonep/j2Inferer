as yet unclassified
unprofile: aMethodProfiler
	(aMethodProfiler isKindOf: J2MethodProfiler)
		ifFalse: [ ^ aMethodProfiler ].
	aMethodProfiler method methodClass addSelector: aMethodProfiler method selector withMethod: aMethodProfiler method.
