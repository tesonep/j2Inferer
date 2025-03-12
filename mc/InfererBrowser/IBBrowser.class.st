Class {
	#name : #IBBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'paginator'
	],
	#category : #InfererBrowser
}

{ #category : #'instance creation' }
IBBrowser class >> openModel: anIBModel [

	^ (self withModel: anIBModel) open
]

{ #category : #'instance creation' }
IBBrowser class >> openModelFor: anIBModel using: anInferer [

	^ (self withModelFor: anIBModel using: anInferer) open
]

{ #category : #'instance creation' }
IBBrowser class >> openOn: anIBVariable [
	^ self new
		openOn: anIBVariable;
		yourself
]

{ #category : #'as yet unclassified' }
IBBrowser class >> openOn: aPackage using: anInferer [
	^ self new
		openOn: aPackage using: anInferer;
		yourself
]

{ #category : #'instance creation' }
IBBrowser class >> withModel: anIBModel [

	^ self new
		  model: anIBModel;
		  yourself
]

{ #category : #'instance creation' }
IBBrowser class >> withModelFor: anIBModel using: anInferer [

	^ self new
		  modelFor: anIBModel using: anInferer;
		  yourself
]

{ #category : #layout }
IBBrowser >> defaultLayout [

	^ SpBoxLayout new
		  add: paginator;
		  yourself
]

{ #category : #initialization }
IBBrowser >> initializePresenters [

	paginator := self instantiate: SpMillerPaginatorPresenter
]

{ #category : #'as yet unclassified' }
IBBrowser >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Type Inferer Browser';
		initialExtent: 500 @ 600
]

{ #category : #'as yet unclassified' }
IBBrowser >> model: aIBModel [

	self open: aIBModel from: nil
]

{ #category : #'as yet unclassified' }
IBBrowser >> modelFor: aPackage using: anInferer [
	self model: (IBPackageModel for: aPackage using: anInferer)
]

{ #category : #'as yet unclassified' }
IBBrowser >> open: anIBModel from: anExistingPresenter [

	anIBModel whenModelOpenedDo: [ :model |
		self open: model from: anIBModel ].
	paginator removeAllAfter: anExistingPresenter.
	paginator addPresenter: anIBModel.
	paginator selectPage: paginator pages size
]

{ #category : #'as yet unclassified' }
IBBrowser >> openOn: aIBModel [
	pager := GLMPager new.
	pager title: 'Type Inferer Browser'.
	pager with: [ :factory | factory show: [ :builder :element | element buildView: builder ] ].
	pager openOn: aIBModel
]

{ #category : #'as yet unclassified' }
IBBrowser >> openOn: aPackage using: anInferer [
	self openOn: (IBPackageModel for: aPackage using: anInferer)
]
