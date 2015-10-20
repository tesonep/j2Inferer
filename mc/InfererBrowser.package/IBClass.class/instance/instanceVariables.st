accessing
instanceVariables
	^self element instanceVariables collect:[:each | IBVariable for:each on: {self element}].