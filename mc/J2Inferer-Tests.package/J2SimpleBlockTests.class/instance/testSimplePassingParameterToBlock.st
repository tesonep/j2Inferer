tests
testSimplePassingParameterToBlock
	| classInfo methodInfo |	
	self inferMethod: BlockClosure >> #value.
		
	classInfo := self inferClass: J2SimpleBlockTestCode.
	methodInfo := classInfo methodTypeFor: J2SimpleBlockTestCode >> #anotherMethodPassingParameter.
	self assert: methodInfo returnType hasType: { SmallInteger  }  onContext: { classInfo }. 
	