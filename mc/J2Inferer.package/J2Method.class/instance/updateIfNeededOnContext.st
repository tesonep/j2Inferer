accessing
updateIfNeededOnContext
	methodStamp = method stamp
		ifFalse:
			[ 
			inferer notifier openingMethod: self.
			J2AstVisitor new
				method: self;
				inferer: inferer;
				visitNode: method ast.
			methodStamp := method stamp.
			inferer notifier openMethod: self ]