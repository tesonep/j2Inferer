accessing
instanceVariables
"Returns teh dictionary if exists and a new one if it is empty."
	^ instanceVariables ifNil:[ IdentityDictionary new].