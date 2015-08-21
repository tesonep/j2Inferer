accesing type variables
typeInfoFor: aClass
	| cls |
	^ classes
		at: aClass name
		ifAbsent:
			[ 
			self notifier generatingClass: aClass.
			cls := J2Class new
				analysedClass: aClass;
				inferer: self.
			classes at:aClass name put: cls.
			self notifier fillingClass: aClass.
			cls fill.
			self notifier generatedClass: aClass. 
			cls
			]