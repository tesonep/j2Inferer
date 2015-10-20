accessing
methodsOn: context
	" This special case is when the receiver is super. Taking the super class for the lookup"
 	| superContext |
	superContext := context collect:#superclass.
	
	^ inferer implementorsFor: self onContext: superContext 