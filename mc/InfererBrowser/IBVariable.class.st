Class {
	#name : #IBVariable,
	#superclass : #IBModel,
	#instVars : [
		'classes',
		'messages'
	],
	#category : #InfererBrowser
}

{ #category : #accessing }
IBVariable >> buildView: builder [
	builder stackedArrangement.
	builder title: self title.
	builder
		list
			title:'Possible Classes of variable ', self name;
			display:[:each | (each element possibleClassesInContext: context) collect:#asIBModel];
			format:#name.
	builder 
		list 
			title:'Messages sent to ',self name;
			display:[:each | each element allSelectors: context].
			
]

{ #category : #accessing }
IBVariable >> classes [

	^ (self element possibleClassesInContext: context) collect:
		  #asIBModel
]

{ #category : #initialization }
IBVariable >> initializePresenters [

	classes := self newModelList.
	messages := self newList.
	self buildLayout
]

{ #category : #hooks }
IBVariable >> lists [

	^ {
		  (IBModelList
			   named: 'Possible classes'
			   list: classes
			   itemsBlock: [ self classes ]).
		  (IBModelList
			   named: 'Messages sent to it'
			   list: messages
			   itemsBlock: [ self messages ]) }
]

{ #category : #accessing }
IBVariable >> messages [

	^ self element allSelectors: context
]

{ #category : #'as yet unclassified' }
IBVariable >> modelType [

	^ 'Variable'
]

{ #category : #accessing }
IBVariable >> name [
	^ self element variableName
]

{ #category : #accessing }
IBVariable >> title [
	^ 'Variable ', self element name.
]
