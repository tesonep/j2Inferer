accesing type variables
typeInfoFor: aClass
	| cls |
	^ classes
		at: aClass name asSymbol
		ifAbsentPut: [ 
							self notifier generatingClass: aClass.
							cls := JNClass newForClass: aClass.
							self notifier generatedClass: aClass.
							cls 
			]