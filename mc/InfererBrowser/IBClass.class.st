Class {
	#name : #IBClass,
	#superclass : #IBModel,
	#category : 'InfererBrowser'
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

{ #category : #accessing }
IBClass >> instanceVariables [
	^self element instanceVariables collect:[:each | IBVariable for:each on: {self element}].
]

{ #category : #accessing }
IBClass >> methods [
	^self element methods collect:[:each | IBMethod for:each on: {self element} ].
]

{ #category : #accessing }
IBClass >> name [
	^ element analysedClass name.
]
