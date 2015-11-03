variables
addVariable: name
	self variables
		at: name
		ifPresent: [ self error: 'Duplicated variable ' , name , ' in ' , self printString ].
	self variables at: name put: (JNVariable newNamed: name)