Class {
	#name : #J2MemorySize,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : 'J2Inferer-Stats'
}

{ #category : #'as yet unclassified' }
J2MemorySize >> addGraph: root [
	| analyzer clusterization analysis size|
	analyzer := FLAnalyzer new.
	analysis := analyzer analysisFor: J2Inferer instance.
	clusterization := analysis clusterization.
	
	size := clusterization clusters sum:[:c| c objects size].
	objects := IdentitySet new: size.
	
	clusterization clusters do:[:c |
		c objects do:[:e|
			(self filter:e) ifTrue:[objects add:e].
		].
	]

]

{ #category : #'as yet unclassified' }
J2MemorySize >> filter: obj [.
	obj ifNil:[^false].
	obj isCompiledMethod ifTrue:[^false].
	obj isClass ifTrue:[^false].
	obj isTrait ifTrue:[^false].
	(obj isKindOf: SmallInteger) ifTrue:[^false].
	(obj isKindOf: Boolean) ifTrue:[^false].
	^true.
]

{ #category : #'as yet unclassified' }
J2MemorySize >> groupByClass [
	^ (self objects groupBy:[:e | e class]  having:[ :x | true]) asOrderedCollection sort:[:a :b | a size > b size].
]

{ #category : #'as yet unclassified' }
J2MemorySize >> initialize [
	super initialize.
	objects := IdentitySet new:50000.
]

{ #category : #'as yet unclassified' }
J2MemorySize >> memorySize [
	^ self objects sum:#sizeInMemory.
]

{ #category : #'as yet unclassified' }
J2MemorySize >> objects [
	^ objects

]

{ #category : #'as yet unclassified' }
J2MemorySize >> objectsSize [
	^ self objects size.
]
