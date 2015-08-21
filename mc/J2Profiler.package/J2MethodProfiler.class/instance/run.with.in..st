accessing
run: aMethod with: parameters in: aReceiver
	| r |
	self class isProfileActive
		ifTrue:
			[ 
			self class
				log:
					'Running ' , aMethod name , ' with ' , (parameters collect: #class) printString , ' in ' , aReceiver class printString
						, aReceiver identityHash printString ].
	r := method valueWithReceiver: aReceiver arguments: parameters.
	self class isProfileActive
		ifTrue:
			[ 
			self class
				log:
					'Run ' , aMethod name , ' with ' , (parameters collect: #class) printString , ' in ' , aReceiver class printString
						, aReceiver identityHash printString ].
	^ r