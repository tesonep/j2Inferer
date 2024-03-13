"
Relates a message argument with a method parameter. It can be done synchronous, but this task existists in case the method does not have the parameters yet.
"
Class {
	#name : #J2RelateParametersTask,
	#superclass : #J2AbstractTask,
	#instVars : [
		'method',
		'parameterVariable',
		'index'
	],
	#category : 'J2Inferer-Tasks'
}

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> = anotherTask [
	^anotherTask compareToRelateParameters: self.
]

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> compareToRelateParameters: anotherTask [
	^ anotherTask method = self method
		and:
			[ 
			anotherTask parameterVariable = self parameterVariable
				and: [ anotherTask index = self index ] ]
]

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> execute [
	(method parameters at: index) addSubtype: parameterVariable.
]

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> hash [
	^ self method hash.
]

{ #category : #accessing }
J2RelateParametersTask >> index [
	^ index
]

{ #category : #accessing }
J2RelateParametersTask >> index: anObject [
	index := anObject
]

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> mergeWith: anotherTask [
	^ anotherTask.
]

{ #category : #accessing }
J2RelateParametersTask >> method [
	^ method
]

{ #category : #accessing }
J2RelateParametersTask >> method: anObject [
	method := anObject
]

{ #category : #accessing }
J2RelateParametersTask >> parameterVariable [
	^ parameterVariable
]

{ #category : #accessing }
J2RelateParametersTask >> parameterVariable: anObject [
	parameterVariable := anObject
]

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> runLevel [
	^ 2.
]

{ #category : #'as yet unclassified' }
J2RelateParametersTask >> shouldEnqueue [
	^true.
]
