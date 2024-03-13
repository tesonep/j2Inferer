Class {
	#name : #J2BasicIdentityHashPredefinedMethod,
	#superclass : #J2AbstractPredefinedMethod,
	#category : #'J2Inferer-PredefinedMethods'
}

{ #category : #initialization }
J2BasicIdentityHashPredefinedMethod >> config [
	selectors := #(#basicIdentityHash)
]

{ #category : #accessing }
J2BasicIdentityHashPredefinedMethod >> parameters [
	^#()
]

{ #category : #applying }
J2BasicIdentityHashPredefinedMethod >> remainingContextFor: aMessage onContext: alreadyEvaluated [
	"There is nothing remaining, all the elements in the context are used"

	^ J2Context empty
]

{ #category : #applying }
J2BasicIdentityHashPredefinedMethod >> returnTypeFor: message onContext: aContext alreadyEvaluated: anObject [
	^ J2Type
		withClasses:
			(aContext
				collect: [ :e | inferer typeInfoFor: self basicIdentityHash class ])
]
