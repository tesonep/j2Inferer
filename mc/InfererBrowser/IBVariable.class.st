Class {
	#name : #IBVariable,
	#superclass : #IBModel,
	#category : 'InfererBrowser'
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
IBVariable >> name [
	^ self element variableName
]

{ #category : #accessing }
IBVariable >> title [
	^ 'Variable ', self element name.
]
