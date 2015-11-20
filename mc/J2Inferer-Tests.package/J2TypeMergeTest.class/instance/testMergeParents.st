as yet unclassified
testMergeParents
   | t |
	t := self typeWithClasses: { Number. SmallInteger }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Number }) asSet.