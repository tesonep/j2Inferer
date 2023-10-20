Class {
	#name : #IBMethod,
	#superclass : #IBModel,
	#category : 'InfererBrowser'
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

{ #category : #'as yet unclassified' }
IBMethod >> name [
	^ self element selector 
]

{ #category : #'as yet unclassified' }
IBMethod >> parameters [
	^ self element parameters collect:[:e | IBVariable for:e on: context].
]
