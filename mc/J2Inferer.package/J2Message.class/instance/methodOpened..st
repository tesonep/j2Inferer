as yet unclassified
methodOpened: aMethod
	self methods add: aMethod. 
	aMethod subtypeParameters: self.
	self updated.