accessing
selfAndSuperclasses:alreadyCalculated 
	(alreadyCalculated includes:self) ifTrue:[^alreadyCalculated].
	alreadyCalculated add: self.

	superclass ifNil: [ ^ alreadyCalculated].
	^ superclass selfAndSuperclasses: alreadyCalculated