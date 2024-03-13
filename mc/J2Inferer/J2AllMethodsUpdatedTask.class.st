"
Check if all the methods in the inferer are updated, if not it will open the none.
"
Class {
	#name : #J2AllMethodsUpdatedTask,
	#superclass : #J2AbstractTask,
	#category : 'J2Inferer-Tasks'
}

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> = anotherTask [
	^ anotherTask compareToAllMethodsUpdated: self.
]

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> compareToAllMethodsUpdated: anotherTask [
	"There are always equals, because we want only one."
	^ true.
]

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> execute [
	((self inferer classes values flatCollect:#methods) reject:#isUpdated ) do:[ :e |
		self inferer enqueueMethod: e	method
	]
]

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> hash [
	^ 1.
]

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> mergeWith: anotherTask [
	
]

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> runLevel [
	^4
]

{ #category : #'as yet unclassified' }
J2AllMethodsUpdatedTask >> shouldEnqueue [
	^true.
]
