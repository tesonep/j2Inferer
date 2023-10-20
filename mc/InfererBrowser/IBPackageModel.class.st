Class {
	#name : #IBPackageModel,
	#superclass : #IBModel,
	#instVars : [
		'classes'
	],
	#category : 'InfererBrowser'
}

{ #category : #accessing }
IBPackageModel >> buildView: builder [
	builder title:'Type Info >> Package ', self element name.
	builder list 
		display:[:each | self classes];
		format:[:each | each name]
]

{ #category : #accessing }
IBPackageModel >> classes [
	^ classes
]

{ #category : #initialization }
IBPackageModel >> for: anElement using: anInferer [
	super for: anElement using: anInferer.
	classes := anElement classes collect:[:c | IBClass for:(anInferer typeInfoFor: c)].
]
