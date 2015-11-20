as yet unclassified
testMergeSiblingsInManyLevels5
	| t |
	t := self
		typeWithClasses:
			{SmallInteger.
			LargeNegativeInteger.
			False.
			LargePositiveInteger.
			Float.
			True.
			ScaledDecimal}.
	self assertCollection: t classes equals: (self asJ2Classes: {Number. Boolean}) asSet