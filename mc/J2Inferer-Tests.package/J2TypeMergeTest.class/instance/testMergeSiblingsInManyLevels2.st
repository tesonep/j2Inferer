as yet unclassified
testMergeSiblingsInManyLevels2
   | t |
	t := self typeWithClasses: { SmallInteger. LargeNegativeInteger. LargePositiveInteger. Float }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Integer. Float }) asSet.