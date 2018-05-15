as yet unclassified
testNestedBlocksContextParameters
	| methodInfo methodContext blocksContext |
	methodInfo := self inferMethod: J2NestedContextTestClass >> #nestedBlocksContextParameters:.
	methodContext := self containerFor: methodInfo.
	blocksContext := astContainers values reject:[ :e | e isMethodContext].
	
	self assert:methodContext temporaryVariables size equals:0.
	self assert:methodContext element parameters size equals:1.

	self assert:(methodContext element parameters anySatisfy: [:e | e variableName = #aParameter]).

	blocksContext do:[:eachBlock | self assert:eachBlock temporaryVariables size equals:0 ].
	blocksContext do:[:eachBlock | self assert:eachBlock element parameters size equals:0 ].
	
	self assert: methodInfo classTypeInfo instanceVariables size equals: 0.
