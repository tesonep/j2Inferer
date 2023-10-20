"
This is for the special case when the message is sent to super.
"
Class {
	#name : #J2SuperMessage,
	#superclass : #J2Message,
	#category : 'J2Inferer-Variables'
}

{ #category : #accessing }
J2SuperMessage >> methodsOn: context [
	" This special case is when the receiver is super. Taking the super class for the lookup"
 	| superContext |
	superContext := context superClassContext.
	
	^ self inferer implementorsFor: self onContext: superContext 
]
