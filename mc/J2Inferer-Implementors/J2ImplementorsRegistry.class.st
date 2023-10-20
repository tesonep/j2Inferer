"
A very specialized cache for resolving the implementors of a selector or a bunch of selectors.

- fill Fill all the data.
- implementorsOf: aSelector returns the set of implementors of this selector.
- implementorsOfAll: aBunchOfSelectos taking the collection of selectors it returns the set of classes implementing all the selectors.
- singleImplementorOf: aBunchOfSelectors taking the collection of selectors it returns, if there is, the single implementor that can understand all of this messages.
"
Class {
	#name : #J2ImplementorsRegistry,
	#superclass : #Object,
	#instVars : [
		'selectors',
		'knownObjectMessages',
		'allUnderstandingCache'
	],
	#category : 'J2Inferer-Implementors'
}

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> addMethod: aMethod [
	| x |
	x := self at:aMethod selector.
	x add:aMethod.
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> allUnderstanding: aSelector [
	^ allUnderstandingCache
		at: aSelector
		ifAbsentPut:
			[ ((self at: aSelector) methods collect: #methodClass) flatCollect: #withAllSubclasses ]
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> at: aSymbol [
	^ selectors at: aSymbol ifAbsentPut: [ J2Implementors new ]
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> fill [
	| classes env |
	env := RBBrowserEnvironment new.
	classes := env classes , env traits.
	selectors := IdentityDictionary new: 46000.
	classes do: [ :c | c methods do: [ :m | self addMethod: m ] ].
	allUnderstandingCache := LRUCache new.
	allUnderstandingCache maximumWeight: 20.
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> implementorsOf: aSelector [
	^ (self at:aSelector) methods.
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> implementorsOfAll: bunchOfSelectors [
	| bunch possible  first  candidates |
	"Let's discard all the methods implemented in object, because everybody has them."
	bunchOfSelectors ifEmpty: [ ^#() ].
	bunch := OrderedCollection new:(bunchOfSelectors size).
	bunchOfSelectors do:[:e |
			(self knownObjectMessages includes:e) ifFalse:[ bunch add:e].
		].
	
	bunch ifEmpty: [ ^#() ].
	first := bunch detectMin: [ :each | (self at:each) size ].

	possible := self allUnderstanding: first.
	possible ifEmpty: [ ^#() ].
	
	2 to: bunch size do:[:i |  
		candidates := self allUnderstanding: (bunch at:i).
		possible := possible intersection: candidates.			
		possible ifEmpty: [ ^#() ].	
	].	

	^ possible.
	
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> knownObjectMessages [
	^ knownObjectMessages ifNil: [ 
		knownObjectMessages := IdentitySet new:2048.
		knownObjectMessages addAll:(Class allMethods collect: #selector). ]
]

{ #category : #'as yet unclassified' }
J2ImplementorsRegistry >> singleImplementorOf: bunchOfSelectors [
	| possible |

	possible := self implementorsOfAll: bunchOfSelectors.
	^ (possible size = 1) ifTrue:possible ifFalse:nil.
	
]
