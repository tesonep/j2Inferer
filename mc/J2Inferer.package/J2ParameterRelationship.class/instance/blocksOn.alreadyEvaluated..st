minimal types
blocksOn: aContext alreadyEvaluated: alreadyEvaluated
	"I have to change the context if is the meta class the receiver"

	| newContext |
	newContext := isMeta
		ifTrue: [ (aContext collect: #metaClass) asSet ]
		ifFalse: [ aContext ].
	^ expression blocksOn: aContext alreadyEvaluated: alreadyEvaluated