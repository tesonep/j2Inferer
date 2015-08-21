accessing
addParameterFor: aName
	(self parameters anySatisfy: [ :e | e name = aName ])
		ifFalse: [ 
			self parameters
				add:
					(J2Variable new
						variableName: aName;
						container: self;
						inferer: self inferer
						yourself) ]