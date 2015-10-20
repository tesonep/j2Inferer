updating
updateIfNeeded
	self isUpdated 
		ifFalse:
			[ 
			inferer notifier openingMethod: self.
			self cleanForUpdate.
			J2AstVisitor new
				inferer: inferer;
				method: self;
				visitNode: self method ast.
			updated := true.
			inferer notifier openMethod: self ]