generating data
updateMethod: aMethod
	| astNode |
	astNode := aMethod ast.
	self addVariable: aMethod selector , '.^'.
	astNode arguments do:[:each | self addVariable: aMethod selector , '.' , each name ].
	astNode temporaries do:[:each | self addVariable: aMethod selector , '.' , each name ].
	
	JNAstVisitor visit: astNode of: aMethod in: self.