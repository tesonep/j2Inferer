as yet unclassified
testMergeSiblingsInManyLevels
   | t |
	t := self typeWithClasses: { SmallInteger. LargeNegativeInteger. LargePositiveInteger }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Integer }) asSet.