accessing
classes
	| results remainings |
	results := Set new: minClasses size.
	minClasses do:[:c |
			(minClasses includesAny: c superclasses) ifFalse:[
				results add: c.	
			]
	].

	remainings := results asOrderedCollection.

	[ remainings isEmpty ] whileFalse: [ | c siblings |
		c := remainings first.
		c superclass ifNotNil: [ 
			siblings := c superclass subclasses.
			(results includesAll: siblings) ifTrue:[
				remainings removeAllFoundIn: siblings .
				results removeAllFoundIn: siblings.
				results add:c superclass.
				remainings add: c superclass.
			] ifFalse:[remainings remove:c]
		].
	].

	^ results