as yet unclassified
testMergeSiblings
   | t |
	t := self typeWithClasses: { LargeInteger. SmallInteger }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Integer }) asSet.