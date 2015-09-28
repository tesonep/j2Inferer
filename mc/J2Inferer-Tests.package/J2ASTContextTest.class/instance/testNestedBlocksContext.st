as yet unclassified
testNestedBlocksContext
	| methodInfo methodContext blocksContext |
	methodInfo := self inferMethod: J2NestedContextTestClass >> #nestedBlocksContext.
	methodContext := self containerFor: methodInfo.
	blocksContext := astContainers values select:[ :e | e ~= methodContext].
	
	self assert:methodContext temporaryVariables size equals:1.
	blocksContext do:[:eachBlock | self assert:(eachBlock temporaryVariables includesKey: #aVariable) not ].
	
	self assert: methodInfo classTypeInfo instanceVariables size equals: 0.
