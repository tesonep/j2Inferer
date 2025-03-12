Class {
	#name : #IBModelList,
	#superclass : #Object,
	#instVars : [
		'name',
		'listPresenter',
		'items',
		'itemsBlock'
	],
	#category : #InfererBrowser
}

{ #category : #'instance creation' }
IBModelList class >> named: aString list: aListPresenter items: aCollection [

	^ self new
		  name: aString;
		  listPresenter: aListPresenter;
		  items: aCollection;
		  yourself
]

{ #category : #'instance creation' }
IBModelList class >> named: aString list: aListPresenter itemsBlock: aBlock [

	^ self new
		  name: aString;
		  listPresenter: aListPresenter;
		  itemsBlock: aBlock;
		  yourself
]

{ #category : #adding }
IBModelList >> addToLayout: aSpLayout [

	self listPresenter ifNil: [ ^ self ].
	aSpLayout
		add: SpNullPresenter new height: 10;
		add: (self listPresenter owner newLabel
				 label: self name;
				 yourself)
		expand: false;
		add: self listPresenter
]

{ #category : #accessing }
IBModelList >> items [

	^ items ifNil: [ self items: itemsBlock value ]
]

{ #category : #accessing }
IBModelList >> items: aCollection [

	items := aCollection sorted: #yourself ascending
]

{ #category : #accessing }
IBModelList >> itemsBlock: aBlock [

	itemsBlock := aBlock
]

{ #category : #accessing }
IBModelList >> listPresenter [

	^ listPresenter
]

{ #category : #accessing }
IBModelList >> listPresenter: anObject [

	listPresenter := anObject
]

{ #category : #accessing }
IBModelList >> name [

	^ name
]

{ #category : #accessing }
IBModelList >> name: anObject [

	name := anObject
]

{ #category : #accessing }
IBModelList >> putItemsIntoList [

	self items ifNil: [ ^ self ].
	self listPresenter ifNil: [ ^ self ].
	self listPresenter items: self items
]
