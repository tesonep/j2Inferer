accesing type variables
typeInfoFor: aClass
	| cls variableClass |
	^ classes
		at: aClass name asSymbol
		ifAbsent:
			[ 
			variableClass := aClass isMeta ifTrue:J2Metaclass ifFalse:J2Class.
			self notifier generatingClass: aClass.
			cls := variableClass new
				analysedClass: aClass;
				inferer: self.
			classes at: aClass name asSymbol put: cls.
			self notifier fillingClass: aClass.
			cls fill.
			self notifier generatedClass: aClass.
			cls ]