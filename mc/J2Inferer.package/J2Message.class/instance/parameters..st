accessing
parameters: anObject
	(anObject isNil or:[anObject isEmpty]) ifTrue:[parameters := nil].
	parameters := anObject