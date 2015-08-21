executing
execute
	| impls |
	self inferer notifier openingMessage: self message.		
	receivers
		ifEmpty:[
			impls := (self inferer implementors:message selector)
				select: [ :e | e methodClass isClass ].	"Only I care about the classes implementing the method, not the traits. "
			
			impls size <= (self inferer config at: #maxNumberImplementorsToOpen)
				ifTrue:
					[ impls do:[ :e | self inferer enqueueMethod: e subject: message onContext: {self inferer typeInfoFor:e methodClass} ] ]			
		]
		ifNotEmpty:
			[ receivers do:[ :e | self inferer enqueueMethod: (e lookupSelector: message selector) subject: message  onContext: receivers ] ]
		
