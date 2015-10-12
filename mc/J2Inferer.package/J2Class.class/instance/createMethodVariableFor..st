methods
createMethodVariableFor: aMethod
	| m |
	inferer enqueueAllMethodsUpdated.
	^ aMethod methodClass = self analysedClass
		ifTrue: [ 
				m := J2Method new
					inferer: inferer;
					selector: aMethod selector;
					classTypeInfo: self;
					fillReturn;
					fillParameters: aMethod ast;
					yourself.
				methods ifNil:[ methods := Dictionary new ].
				methods at: aMethod selector put: m ]
		ifFalse: [ superclass methodTypeFor: aMethod ]