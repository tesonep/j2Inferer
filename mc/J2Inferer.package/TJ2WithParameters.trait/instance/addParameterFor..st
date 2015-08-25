accessing
addParameterFor: aName
	(self parameters anySatisfy: [ :e | e name = aName asSymbol ])
		ifFalse: [ 
			self parameters
				add:
					(J2Variable new
						variableName: aName asSymbol;
						container: self;
						inferer: self inferer
						yourself) ]