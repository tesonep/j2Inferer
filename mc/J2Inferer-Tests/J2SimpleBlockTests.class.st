Class {
	#name : #J2SimpleBlockTests,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests-Blocks'
}

{ #category : #tests }
J2SimpleBlockTests >> testBindingParameters [
	| classInfo methodInfo |	
	self skip.
	self inferMethod: BlockClosure >> #value.
		
	classInfo := self inferClass: J2SimpleBlockTestCode.
	methodInfo := classInfo methodTypeFor: J2SimpleBlockTestCode >> #concatenatedBlock.
	self assert: methodInfo returnValue hasType: { SmallInteger  }  onContext: { classInfo }. 
	
]

{ #category : #tests }
J2SimpleBlockTests >> testSimplePassingParameterToBlock [
	| classInfo methodInfo |	
	self inferMethod: BlockClosure >> #value.
		
	classInfo := self inferClass: J2SimpleBlockTestCode.
	methodInfo := classInfo methodTypeFor: J2SimpleBlockTestCode >> #anotherMethodPassingParameter.
	self assert: methodInfo returnValue hasType: { SmallInteger  }  onContext: { classInfo }. 
	
]

{ #category : #tests }
J2SimpleBlockTests >> testSimplesExampleOfValue [
	| classInfo methodInfo |	
	self inferMethod: BlockClosure >> #value.
		
	classInfo := self inferClass: J2SimpleBlockTestCode.
	methodInfo := classInfo methodTypeFor: J2SimpleBlockTestCode >> #soSimpleBlockTest.
	self assert: methodInfo returnValue hasType: { SmallInteger  }  onContext: { classInfo }. 
	
]
