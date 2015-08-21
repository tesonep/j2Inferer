as yet unclassified
testContentsType
	| classInfo  |
	classInfo := self inferClass: Bag.
	self assert: (classInfo variableFor: #contents) hasType: {Dictionary}.