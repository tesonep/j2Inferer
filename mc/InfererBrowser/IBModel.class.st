Class {
	#name : #IBModel,
	#superclass : #SpPresenter,
	#traits : 'TComparable',
	#classTraits : 'TComparable classTrait',
	#instVars : [
		'inferer',
		'element',
		'context',
		'modelOpenBlock',
		'activationBlock'
	],
	#category : #InfererBrowser
}

{ #category : #'instance creation' }
IBModel class >> for: anElement [
	^ self new for:anElement using:anElement inferer;
		yourself.
]

{ #category : #'instance creation' }
IBModel class >> for: anElement on: aContext [
	^ self new for:anElement using:anElement inferer context:aContext;
		yourself.
]

{ #category : #'instance creation' }
IBModel class >> for: anElement using:inferer [
	^ self new for:anElement using:inferer;
		yourself.
]

{ #category : #comparing }
IBModel >> < aComparable [
	"Answer whether the receiver is less than the argument."

	^ self name < aComparable name
]

{ #category : #comparing }
IBModel >> = aComparable [
	"Compare the receiver with the argument and answer with true if the
	receiver is equal to the argument. Otherwise answer false."

	^ self class = aComparable class and: [
		  self element = aComparable element ]
]

{ #category : #initialization }
IBModel >> buildLayout [

	| innerLayout |
	innerLayout := SpBoxLayout newTopToBottom.
	innerLayout
		add: (self newLabel
				 label: self contentTitle;
				 yourself)
		expand: false.

	self lists do: [ :each | each addToLayout: innerLayout ].
	self layout: innerLayout
]

{ #category : #accessing }
IBModel >> buildView: builder [
]

{ #category : #initialization }
IBModel >> connectPresenters [

	self connectPresentersWithElement.
	self propagateActivation
	
]

{ #category : #initialization }
IBModel >> connectPresentersWithElement [

	self element ifNil: [ ^ self ].
	self lists do: [ :each | each putItemsIntoList ].
	self buildLayout
]

{ #category : #hooks }
IBModel >> contentTitle [

	^ self modelType , ' ' , self quotedName
]

{ #category : #accessing }
IBModel >> element [
	^ element
]

{ #category : #initialization }
IBModel >> for: anElement using: anInferer [

	element := anElement.
	inferer := anInferer.
	self connectPresentersWithElement
]

{ #category : #initialization }
IBModel >> for: anElement using: anInferer context: aContext [

	context := aContext.
	self for: anElement using: anInferer
]

{ #category : #comparing }
IBModel >> hash [
	"Hash must be redefined whenever = is redefined."

	^ self class hash bitXor: self element hash
]

{ #category : #accessing }
IBModel >> inferer [
	^ inferer
]

{ #category : #initialization }
IBModel >> initializePresenters [

	self subclassResponsibility
]

{ #category : #hooks }
IBModel >> lists [
	"Return collection of IBModelList"

	^ self subclassResponsibility
]

{ #category : #hooks }
IBModel >> modelType [

	^ self subclassResponsibility
]

{ #category : #accessing }
IBModel >> name [

	self element ifNil: [ ^ '' ].
	^ self element name
]

{ #category : #'instance creation' }
IBModel >> newModelList [

	^ self newList
		  display: #name;
		  whenSelectedDo: [ :item | self selectedModel: item ];
		  yourself
]

{ #category : #initialization }
IBModel >> propagateActivation [

	activationBlock ifNil: [ ^ self ].
	self lists do: [ :each |
		each listPresenter ifNotNil: [ :presenter |
			presenter whenActivatedDo: activationBlock ] ]
]

{ #category : #accessing }
IBModel >> quotedName [

	self element ifNil: [ ^ '' ].
	^ '"' , self element name , '"'
]

{ #category : #accessing }
IBModel >> selectedModel: aIBModel [

	^ modelOpenBlock ifNotNil: [ modelOpenBlock cull: aIBModel ]
]

{ #category : #comparing }
IBModel >> threeWayCompareTo: anObject [
	"Answer whether the receiver is less than the argument."

	^ self name threeWayCompareTo: anObject name
]

{ #category : #events }
IBModel >> whenActivatedDo: aBlock [

	activationBlock := aBlock.
	self propagateActivation
]

{ #category : #events }
IBModel >> whenModelOpenedDo: aBlock [

	modelOpenBlock := aBlock
]
