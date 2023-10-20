Class {
	#name : #J2UpdateMethodTest,
	#superclass : #J2AbstractTests,
	#instVars : [
		'classFactory'
	],
	#category : 'J2Inferer-Tests'
}

{ #category : #running }
J2UpdateMethodTest >> setUp [
	super setUp.
	classFactory := ClassFactoryForTestCase new.
]

{ #category : #running }
J2UpdateMethodTest >> tearDown [
	super tearDown.
	classFactory deleteClasses.
]

{ #category : #'as yet unclassified' }
J2UpdateMethodTest >> testInferingSimpleClass [
	| mockClass classInfo methodInfo methodInfo2 |
	mockClass:= classFactory silentlyNewSubclassOf: Object instanceVariableNames:''  classVariableNames: ''.
	mockClass compile: '
	returnsAValue
		^ 73.
	'.
	
	classInfo := self inferClass: mockClass.
	methodInfo := inferer methodVariableFor: mockClass >> #returnsAValue.
	
	self assert: methodInfo returnValue  hasType: {SmallInteger}  onContext: {classInfo}..
	methodInfo forceUpdate. 

	mockClass compile: '
	returnsAValue
		^ ''Hello''.
	'.
	
	self inferMethod: mockClass >> #returnsAValue.
	methodInfo2 := inferer methodVariableFor: mockClass >> #returnsAValue.
	
	self assert: methodInfo = methodInfo2.
	self assert: methodInfo returnValue  hasType: { ByteString }  onContext:{classInfo}.
]
