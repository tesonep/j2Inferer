parameters
subtypeParameter: aParameter with: aMessageParameter on: aMessage
	"If the message is sent in the same class or a superclass of the method container, we have a stronger relationship. Usually used in the initialize."
	(classTypeInfo selfAndSuperclasses includes:aMessage containerClass)
		ifTrue: [ aParameter addSubtype: aMessageParameter	"Adds subtype and supertype relations" ]
		ifFalse: [ aMessageParameter addSupertype: aParameter ]
