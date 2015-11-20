as yet unclassified
testMergeSiblingsInManyLevels4
	| t |
	t := self
		typeWithClasses:
			{SmallInteger.
			LargeNegativeInteger.
			False.
			LargePositiveInteger.
			Float.
			ScaledDecimal}.
	self assertCollection: t classes equals: (self asJ2Classes: {Number. False}) asSet