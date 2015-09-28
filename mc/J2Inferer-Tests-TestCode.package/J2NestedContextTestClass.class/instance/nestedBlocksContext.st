test code
nestedBlocksContext
	| aVariable |
	aVariable := 3.
	aVariable 
		ifNil:[ aVariable := 27]
		ifNotNil:[
			(aVariable > 5) 
				ifTrue:[
					| anotherVariable|
					anotherVariable := aVariable * 25. 
					^ anotherVariable 
				] ifFalse: [ ^ aVariable:= 5 ]
		]