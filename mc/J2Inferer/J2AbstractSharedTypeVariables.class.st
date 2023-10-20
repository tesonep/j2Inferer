"
Represents the variables that are shared and have a common behavior.
"
Class {
	#name : #J2AbstractSharedTypeVariables,
	#superclass : #Object,
	#category : 'J2Inferer-Variables'
}

{ #category : #subtyping }
J2AbstractSharedTypeVariables >> addMessageSent: aMessage [ 
	
]

{ #category : #subtyping }
J2AbstractSharedTypeVariables >> addSupertype: aVariable [.
]

{ #category : #blocks }
J2AbstractSharedTypeVariables >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [ 
	^ #().
]

{ #category : #accessing }
J2AbstractSharedTypeVariables >> classTypeInfo [
	^ nil
]

{ #category : #blocks }
J2AbstractSharedTypeVariables >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ false.
]

{ #category : #accessing }
J2AbstractSharedTypeVariables >> minClassesInContext: aContext [
	^ self minClassesInContext: aContext alreadyEvaluated: Dictionary new.

]
