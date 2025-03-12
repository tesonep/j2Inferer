Class {
	#name : #IBPackageModel,
	#superclass : #IBModel,
	#instVars : [
		'classModels',
		'classes'
	],
	#category : #InfererBrowser
}

{ #category : #accessing }
IBPackageModel >> buildView: builder [
	builder title:'Type Info >> Package ', self element name.
	builder list 
		display:[:each | self classes];
		format:[:each | each name]
]

{ #category : #accessing }
IBPackageModel >> classModels [
	^ classModels
]

{ #category : #accessing }
IBPackageModel >> classes [
	^ classes
]

{ #category : #initialization }
IBPackageModel >> for: anElement using: anInferer [

	classModels := anElement classes collect: [ :c |
		               IBClass for: (anInferer typeInfoFor: c) ].
	super for: anElement using: anInferer
]

{ #category : #initialization }
IBPackageModel >> initializePresenters [

	classes := self newModelList.
	self buildLayout
]

{ #category : #hooks }
IBPackageModel >> lists [

	^ { (IBModelList
		   named: 'Classes'
		   list: classes
		   itemsBlock: [ self classModels ]) }
]

{ #category : #'as yet unclassified' }
IBPackageModel >> modelType [

	^ 'Package'
]
