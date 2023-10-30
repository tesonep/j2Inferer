Class {
	#name : #IBMethod,
	#superclass : #IBModel,
	#instVars : [
		'parameters',
		'returnTypes'
	],
	#category : #InfererBrowser
}

{ #category : #accessing }
IBMethod >> buildView: builder [
	builder stackedArrangement.
	builder title:'Method ', self element name.	
	builder list
		title:'Possible Classes of the Returned Value';
		display:[ :each | 
			(each element returnValue possibleClassesInContext:context) collect:#asIBModel];
		format: #name.
	builder list
		title:'Parameters';
		display:[ :each | each parameters];
		format: #name		
]

{ #category : #initialization }
IBMethod >> initializePresenters [

	returnTypes := self newModelList.
	parameters := self newModelList.
	self buildLayout
]

{ #category : #hooks }
IBMethod >> lists [

	^ {
		  (IBModelList
			   named: 'Possible Types of the Returned Values'
			   list: returnTypes
			   itemsBlock: [ self returnTypes ]).
		  (IBModelList
			   named: 'Parameters'
			   list: parameters
			   itemsBlock: [ self parameters ]) }
]

{ #category : #hooks }
IBMethod >> modelType [

	^ 'Method'
]

{ #category : #'as yet unclassified' }
IBMethod >> name [
	^ self element selector 
]

{ #category : #accessing }
IBMethod >> parameters [

	^ self element parameters collect: [ :e |
		  e asIBModelOnContext: context ]
]

{ #category : #accessing }
IBMethod >> returnTypes [

	^ (self element returnValue possibleClassesInContext: context)
		  collect: [ :e | e asIBModelOnContext: context ]
]
