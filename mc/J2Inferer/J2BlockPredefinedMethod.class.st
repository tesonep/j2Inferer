"
These object handles the ""value"" messages of a block.
"
Class {
	#name : #J2BlockPredefinedMethod,
	#superclass : #J2AbstractPredefinedMethod,
	#category : 'J2Inferer-PredefinedMethods'
}

{ #category : #initialization }
J2BlockPredefinedMethod >> config [
	implementingClasses := {inferer typeInfoFor: BlockClosure}.
	parametersTypes := #().
	selectors := #(value value: value:value: value:value:value: value:value:value:value:).
]

{ #category : #accessing }
J2BlockPredefinedMethod >> parameters [
	^#()
]

{ #category : #'testing if can handle' }
J2BlockPredefinedMethod >> parametersMatches: aMessage onContext: aContext [
	^ true.
]

{ #category : #applying }
J2BlockPredefinedMethod >> remainingContextFor: aMessage onContext: aContext [
	"There is nothing remaining, all the elements in the context are used"

	^ J2Context empty
]

{ #category : #applying }
J2BlockPredefinedMethod >> returnTypeFor: message onContext: aContext alreadyEvaluated: alreadyEvaluated [
	| blocks returnType |
	blocks := message receiver blocksOn: aContext.
	returnType := J2Type empty.
	blocks do:
			[ :e | returnType union:(e returnValue minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) ].
	^ returnType
]
