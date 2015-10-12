accessing
methods
	^self element methods collect:[:each | IBMethod for:each on: {self element} ].