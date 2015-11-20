as yet unclassified
testMergeSiblingsInManyLevels3
	| t |
	t := self
		typeWithClasses:
			{SmallInteger.
			LargeNegativeInteger.
			LargePositiveInteger.
			Float.
			ScaledDecimal}.
	self assertCollection: t classes equals: (self asJ2Classes: {Number}) asSet