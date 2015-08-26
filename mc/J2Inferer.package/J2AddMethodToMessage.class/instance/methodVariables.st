accessing
methodVariables
	^ methods collect: [ :m | self inferer methodVariableFor: m ]