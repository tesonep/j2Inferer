accessing
updateIfNeededOnContext: aContext.
	stamp = method stamp
		ifFalse:
			[ 
			inferer notifier openingMethod:self.
			J2AstVisitor new
				method: self;
				inferer: inferer;
				context: aContext;
				visitNode: method ast.
			stamp := method stamp.
			inferer notifier openMethod:self.
			].
