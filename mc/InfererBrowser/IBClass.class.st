Class {
	#name : #IBClass,
	#superclass : #IBModel,
	#instVars : [
		'variables',
		'methods'
	],
	#category : #InfererBrowser
}

{ #category : #accessing }
IBClass >> buildView: builder [
	builder stackedArrangement.
	builder title:'Class ', self element name.
	builder list
		title:'Instance Variables';
		display:[:each | each instanceVariables];
		format:#name.
	builder list
		title:'Methods';
		display:[:each | each methods];
		format:#name.
	
]

{ #category : #initialization }
IBClass >> initializePresenters [

	variables := self newModelList.
	methods := self newModelList.
	self buildLayout
]

{ #category : #accessing }
IBClass >> instanceVariables [

	^ self element instanceVariables collect: [ :each |
		  each asIBModelOnContext: { self element } ]
]

{ #category : #hooks }
IBClass >> lists [

	^ {
		  (IBModelList
			   named: 'Instance variables'
			   list: variables
			   itemsBlock: [ self instanceVariables ]).
		  (IBModelList
			   named: 'Methods'
			   list: methods
			   itemsBlock: [ self methods ]) }
]

{ #category : #accessing }
IBClass >> methods [

	^ self element methods collect: [ :each |
		  each asIBModelOnContext: { self element } ]
]

{ #category : #hooks }
IBClass >> modelType [

	^ 'Class'
]

{ #category : #accessing }
IBClass >> name [
	^ element analysedClass name.
]
