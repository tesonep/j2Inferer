"
This visitor generates all the variables and relationships that then is used in the analysis of the type graph.
"
Class {
	#name : 'J2ProgramNodeVisitor',
	#superclass : 'OCProgramNodeVisitor',
	#instVars : [
		'method',
		'inferer',
		'containerStack',
		'numberOfBlocks'
	],
	#category : 'J2Inferer-AST',
	#package : 'J2Inferer',
	#tag : 'AST'
}

{ #category : 'accessing' }
J2ProgramNodeVisitor >> container [
	^containerStack top
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> inferer [
	^ J2Inferer instance
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> initialize [
	super initialize.
	containerStack := Stack new.
	numberOfBlocks := 0.
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> method [
	^ method
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> method: anObject [
	| classContainer |
	
	method := anObject.
	
	classContainer := J2ClassBasedContainer new
		classVariable: method classTypeInfo;
		yourself.
		
	self
		pushContainer:
			(J2MethodBasedContainer new
				element: method;
				parent: classContainer;
				yourself)
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> popContainer [
	^ containerStack pop.
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> pushContainer: aNewContainer [
	containerStack push: aNewContainer.
	self inferer anASTContainerCreated:aNewContainer for:aNewContainer element.
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> visitArrayNode: anArrayNode [
	| elements |
	anArrayNode children do: [ :each | self visitNode: each ].
	self container
		atExpression: anArrayNode
		ifAbsentPut:
			[ 
			elements := anArrayNode children collect: [ :e | self container atExpression: e ].
			(J2Array newOnClass: self container containerClass)
				addElements: elements;
				yourself ]
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitAssignmentNode: anAssignmentNode [
	| variable |
	
	self visitNode: anAssignmentNode variable.
	self visitNode: anAssignmentNode value.
	variable := self container variableFor: anAssignmentNode variable.
	variable addSubtype: (self container atExpression: anAssignmentNode value).

	self container
		atExpression: anAssignmentNode
		ifAbsentPut:[ variable ]
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitBlockNode: aBlockNode [
	| blk |
	numberOfBlocks := numberOfBlocks + 1.
	
	blk := J2Block index: numberOfBlocks blockNode: aBlockNode onClass: self container containerClass.
		
	self container atExpression: aBlockNode ifAbsentPut: blk.

	self
		pushContainer:
			(J2BlockBasedContainer new
				element: blk;
				parent: self container;
				yourself).

	self visitArgumentNodes: aBlockNode arguments.

	self visitNode: aBlockNode body.
	
	(aBlockNode body statements isNotEmpty and:[ aBlockNode body statements last isReturn not]) 
	ifTrue:[
		blk returnValue addSubtype: (self container atExpression: (aBlockNode body statements last))
	] ifFalse:[
		| nilNode |
		nilNode := RBLiteralValueNode value: 'nil'.
		self inferer addLiteralVariable: nilNode.
		blk returnValue addSubtype: (self container atExpression: nilNode ) 
	].
	
	self popContainer
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> visitCascadeNode: aCascadeNode [ 
	aCascadeNode messages do: [:each | self visitNode: each].
	self container atExpression: aCascadeNode ifAbsentPut: [self container atExpression:(aCascadeNode messages last)]
	
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> visitGlobalNode: aGlobalVariableNode [

	aGlobalVariableNode isClassVariable 
		ifTrue: [ ^ self ].

	self inferer addGlobalVariable: aGlobalVariableNode
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> visitLiteralArrayNode: aRBLiteralArrayNode [
	self container
		atExpression: aRBLiteralArrayNode
		ifAbsentPut: [ self inferer arrayLiteral: aRBLiteralArrayNode ]
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitLiteralNode: aLiteralNode [
	^self inferer addLiteralVariable: aLiteralNode
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitMessageNode: aMessageNode [
	(aMessageNode isCascaded not or: [ aMessageNode isFirstCascaded ])
		ifTrue: [ self visitNode: aMessageNode receiver ].
	aMessageNode arguments do: [ :each | self visitNode: each ].
	self container addMessageSentTo: aMessageNode.
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitMethodNode: aMethodNode [ 
	self visitArgumentNodes: aMethodNode arguments.
	aMethodNode pragmas
		do: [ :each | self visitNode: each ].
	self visitNode: aMethodNode body.
	self container checkDefaultReturnExpression
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitReturnNode: aReturnNode [

	self visitNode: aReturnNode value.
	self container addReturnSubtype: (self container atExpression: aReturnNode value)
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitSelfNode: aSelfNode [

	^ self container
		atExpression: aSelfNode
		ifAbsentPut: [ self inferer selfVariable ]
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitSuperNode: aSuperNode [
	^ self container
		atExpression: aSuperNode
		ifAbsentPut: [ self inferer selfVariable ]
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitTemporaryNode: aNode [
	self container addTemporaryVariableFor: aNode
]

{ #category : 'visiting' }
J2ProgramNodeVisitor >> visitTemporaryNodes: aNodeCollection [
	"This is triggered when defining the temporaries between the pipes"

	^ aNodeCollection do:[ :e | self visitTemporaryNode: e]
]

{ #category : 'accessing' }
J2ProgramNodeVisitor >> visitThisContextNode: aThisContextNode [
	^ self container atExpression: aThisContextNode ifAbsentPut: [ self inferer thisContextVariable]
]
