test code
nestedBlocksContextParameters: aParameter
	aParameter 
		ifNil:[ ^ aParameter + 27]
		ifNotNil:[
			(aParameter > 5) 
				ifTrue:[
					^ aParameter * 25
				] ifFalse: [ ^ 5 ]
		]