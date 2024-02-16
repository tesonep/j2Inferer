"
Entry point for the J2 Inferer process.

This object has all the type data principally:
- Global variables
- Literals
- Classes.

Check the J2InfererManager for examples of how to use it.
"
Class {
	#name : #J2Inferer,
	#superclass : #Object,
	#instVars : [
		'classes',
		'queue',
		'config',
		'literals',
		'globals',
		'notifier',
		'predefinedMessages',
		'implementors',
		'astContainerListener',
		'selfVariable',
		'superVariable',
		'thisContextVariable',
		'literal',
		'arrayLiterals'
	],
	#classVars : [
		'instance'
	],
	#category : #J2Inferer
}

{ #category : #'instance creation' }
J2Inferer class >> default [
	^ self withNotifier: J2NullNotifier new.
]

{ #category : #accessing }
J2Inferer class >> instance [
	^ instance ifNil:[ instance := self default ]
]

{ #category : #accessing }
J2Inferer class >> instance: anInstance [
	^ instance := anInstance
]

{ #category : #'instance creation' }
J2Inferer class >> new [
	^ self error: 'Use default or withNotifier:'
]

{ #category : #'instance creation' }
J2Inferer class >> resetInstance [

	<script>
	^ instance := nil
]

{ #category : #'instance creation' }
J2Inferer class >> withNotifier: aNotifier [
	instance := self basicNew.
	^ instance
		notifier: aNotifier;
		initialize;
		yourself.

]

{ #category : #'creating globals' }
J2Inferer >> addGlobalVariable: aGlobalNode [
	
	globals
		at: aGlobalNode name
		ifAbsentPut: [ J2GlobalVariable new variableName: aGlobalNode name; yourself ]
]

{ #category : #'creating globals' }
J2Inferer >> addLiteralVariable: aLiteralNode [
	^literals at:aLiteralNode value class ifAbsentPut:[
			J2Literal new literalClass: (self typeInfoFor: aLiteralNode value class); 
			yourself.
		]
]

{ #category : #'ast visiting' }
J2Inferer >> anASTContainerCreated:aContainer for:aVariable [
	astContainerListener ifNotNil: [ astContainerListener anASTContainerCreated: aContainer for: aVariable ]
]

{ #category : #'accesing type variables' }
J2Inferer >> arrayLiteral: aArrayLiteralNode [
   | elements |
	elements := (aArrayLiteralNode contents collect:[:e | self typeInfoFor: e value class]) asSet asArray.
	literal := J2ArrayLiteral new.
	literal elementTypes: elements.
	literal typeInfo: (self typeInfoFor: Array).
	
	^ arrayLiterals like: literal ifAbsent:[
			arrayLiterals add: literal.
			literal.
		].
	
]

{ #category : #accessing }
J2Inferer >> classes [
	^ classes
]

{ #category : #accessing }
J2Inferer >> config [
	 ^config.
]

{ #category : #accessing }
J2Inferer >> context [
	^ J2Context with: self classes
]

{ #category : #'tasks operations' }
J2Inferer >> enqueueAllMethodsUpdated [
	queue enqueue: J2AllMethodsUpdatedTask new
]

{ #category : #'tasks operations' }
J2Inferer >> enqueueClass: aClass [
	aClass methodsDo: [ :m | self enqueueMethod: m ].

]

{ #category : #'tasks operations' }
J2Inferer >> enqueueMethod: aMethod [
	notifier enqueueMethod: aMethod.
	aMethod ifNil:[^self].
	queue
		enqueue:
			(J2OpenMethodTask new
				method: aMethod;
				yourself).

]

{ #category : #'tasks operations' }
J2Inferer >> enqueueOpenMethodsFromMessage: aMessage [

	queue
		enqueue:
			(J2OpenMethodFromMessage new
				message: aMessage;
				fillTask;
				yourself)
]

{ #category : #'as yet unclassified' }
J2Inferer >> enqueueRelateMethod: aMethod variableIndex: index parameterVariable: parameterVariable [
	queue
		enqueue:
			(J2RelateParametersTask new
				method: aMethod ;
				index: index;
				parameterVariable:parameterVariable;
				yourself)
]

{ #category : #'implementors-queries' }
J2Inferer >> implementorsFor: aMessage onContext: aContext [
	^ ((aContext contents collect: [ :each | each lookupSelector: aMessage selector ]) reject: #isNil)
		collect: [ :m | self methodVariableFor: m ]
]

{ #category : #'implementors-queries' }
J2Inferer >> implementorsOf: selector [
	^ self implementorsRegistry implementorsOf: selector
]

{ #category : #'implementors-queries' }
J2Inferer >> implementorsOf: aSelector onContext: aContext [
	^ ((aContext collect: [ :each | each lookupSelector:aSelector ]) reject:#isNil) collect:[ :m | self methodVariableFor: m].

]

{ #category : #'implementors-queries' }
J2Inferer >> implementorsRegistry [
	implementors
		ifNil: [ 
			implementors := J2ImplementorsRegistry new.
			implementors fill ].
	^ implementors
]

{ #category : #infering }
J2Inferer >> inferClass: aClass [
	self enqueueClass: aClass.
	self runAndWait.
]

{ #category : #infering }
J2Inferer >> inferClasses: aBunch [
	aBunch do:[:aClass | self enqueueClass: aClass].
	self runAndWait.
	
]

{ #category : #infering }
J2Inferer >> inferMethod: aMethod [
	self enqueueMethod: aMethod.
	self runAndWait.
]

{ #category : #initialization }
J2Inferer >> initPredefinedMessages [
	" This message initialize all the configuration for the predefined messages."

	predefinedMessages add: (J2BasicNewPredefinedMethod forInferer: self).
	predefinedMessages add: (J2ArithmeticOperationsPredefinedMethod forInferer: self).
	predefinedMessages add: (J2BlockPredefinedMethod forInferer: self).
]

{ #category : #initialization }
J2Inferer >> initialize [
	config := J2InfererConfig new.
	
	predefinedMessages := OrderedCollection new.
	
	classes := IdentityDictionary new.
	queue := J2TaskQueue new.
	literals := IdentityDictionary new.
	globals := IdentityDictionary new.
	arrayLiterals := Set new.

	notifier inferer: self.
	queue notifier: notifier.

	self initPredefinedMessages

]

{ #category : #'accesing type variables' }
J2Inferer >> methodVariableFor: aMethod [
	| aClass classTypeInfo  |
	aClass := aMethod methodClass.
	classTypeInfo := self typeInfoFor: aClass.
	^ classTypeInfo methodTypeFor: aMethod.
]

{ #category : #notifier }
J2Inferer >> notifier [
	^ notifier
]

{ #category : #notifier }
J2Inferer >> notifier: aNotifier [
	notifier := aNotifier
]

{ #category : #accessing }
J2Inferer >> predefinedMessages [
	^ predefinedMessages 
]

{ #category : #'ast visiting' }
J2Inferer >> registerASTContainerListener: aListener [
	astContainerListener := aListener.
]

{ #category : #'tasks operations' }
J2Inferer >> runAndWait [
	queue runAndWait
]

{ #category : #'single instance variables' }
J2Inferer >> selfVariable [
	^ selfVariable ifNil: [ selfVariable := J2Self new. ].
]

{ #category : #'implementors-queries' }
J2Inferer >> singleImplementorOf: aBunchOfMessages [
	^self implementorsRegistry singleImplementorOf: aBunchOfMessages
]

{ #category : #statistics }
J2Inferer >> statistics [
	^ 'Classes: ' , classes size asString , ' Literals: ' , literals size asString
		, ' Globals: ' , globals size asString , ' Methods: '
		, (classes sum: #numberOfMethods) asString , ' Queue Size: ' , queue size asString , ' content: ', queue pendingTasksStatistics
]

{ #category : #'single instance variables' }
J2Inferer >> thisContextVariable [
	^ thisContextVariable
		ifNil:
			[ thisContextVariable := J2ThisContext new
				type: (self typeInfoFor: Context);
				yourself ]
]

{ #category : #'accesing type variables' }
J2Inferer >> typeInfoFor: aClass [
	| cls variableClass |
	^ classes
		at: aClass name asSymbol
		ifAbsent:
			[ 
			variableClass := aClass isMeta ifTrue:J2Metaclass ifFalse:J2Class.
			self notifier generatingClass: aClass.
			cls := variableClass new
				analysedClass: aClass.
			classes at: aClass name asSymbol put: cls.
			self notifier fillingClass: aClass.
			cls fill.
			self notifier generatedClass: aClass.
			cls ]
]

{ #category : #'ast visiting' }
J2Inferer >> unregisterASTContainerListener: aListener [
	astContainerListener := nil.
]

{ #category : #'accesing type variables' }
J2Inferer >> variableFor: aNode [
	^ self variableFor: aNode ifAbsent: [ self error: 'Undefined expression:' , aNode ]
]

{ #category : #'accesing type variables' }
J2Inferer >> variableFor: aNode ifAbsent: aValuable [
	| aName |
	aName := aNode infererSource.
	^ globals
		at: aName asSymbol
		ifAbsent:
			[ literals at: aNode value class ifAbsent: aValuable ]
]
