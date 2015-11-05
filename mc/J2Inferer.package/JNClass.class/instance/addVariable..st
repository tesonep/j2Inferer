variables
addVariable: name
	| symbol |
	symbol := name asSymbol.
	self variables
		at: symbol
		ifPresent: [ self error: 'Duplicated variable ' , symbol , ' in ' , self printString ].
	self variables at: symbol put: (JNVariable newNamed: symbol)