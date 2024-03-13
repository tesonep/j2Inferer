"
Representing a self node.
"
Class {
	#name : #J2Self,
	#superclass : #J2AbstractSharedTypeVariables,
	#category : 'J2Inferer-Variables'
}

{ #category : #accessing }
J2Self >> blocksOn: aContext [
	^ #().
]

{ #category : #accessing }
J2Self >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ #().
]

{ #category : #accessing }
J2Self >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	^ J2Type withClasses:aContext contents
]
