Class {
	#name : #J2TypeMergeTest,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests'
}

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> asJ2Classes: aBunch [
	^ aBunch collect:[ :each | inferer typeInfoFor: each]
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeParents [
   | t |
	t := self typeWithClasses: { Number. SmallInteger }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Number }) asSet.
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeSiblings [
   | t |
	t := self typeWithClasses: { LargeInteger. SmallInteger }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Integer }) asSet.
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeSiblingsInManyLevels [
   | t |
	t := self typeWithClasses: { SmallInteger. LargeNegativeInteger. LargePositiveInteger }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Integer }) asSet.
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeSiblingsInManyLevels2 [
   | t |
	t := self typeWithClasses: { SmallInteger. LargeNegativeInteger. LargePositiveInteger. Float }.
	
	self assertCollection: t classes equals: (self asJ2Classes: { Integer. Float }) asSet.
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeSiblingsInManyLevels3 [
	| t |
	t := self
		typeWithClasses:
			{SmallInteger.
			LargeNegativeInteger.
			LargePositiveInteger.
			Float.
			ScaledDecimal}.
	self assertCollection: t classes equals: (self asJ2Classes: {Number}) asSet
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeSiblingsInManyLevels4 [
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
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> testMergeSiblingsInManyLevels5 [
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
]

{ #category : #'as yet unclassified' }
J2TypeMergeTest >> typeWithClasses: aBunch [
	^ J2Type withClasses:(self asJ2Classes: aBunch)
]
