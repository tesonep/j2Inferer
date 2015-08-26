accessing
updateIfNeededOnContext: aContext
	methodStamp = method stamp
		ifFalse:
			[ 
			inferer notifier openingMethod: self.
			J2AstVisitor new
				method: self;
				inferer: inferer;
				context: aContext;
				visitNode: method ast.
			methodStamp := method stamp.
			inferer notifier openMethod: self ]