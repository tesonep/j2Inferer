tests
testBindingParameters
	| classInfo methodInfo |	
	self skip.
	self inferMethod: BlockClosure >> #value.
		
	classInfo := self inferClass: J2SimpleBlockTestCode.
	methodInfo := classInfo methodTypeFor: J2SimpleBlockTestCode >> #concatenatedBlock.
	self assert: methodInfo returnValue hasType: { SmallInteger  }  onContext: { classInfo }. 
	