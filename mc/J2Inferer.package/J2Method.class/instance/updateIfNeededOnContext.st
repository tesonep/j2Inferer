accessing
updateIfNeededOnContext
	methodStamp = method stamp
		ifFalse:
			[ 
			inferer notifier openingMethod: self.
			J2AstVisitor new
				inferer: inferer;
				method: self;
				visitNode: method ast.
			methodStamp := method stamp.
			inferer notifier openMethod: self ]