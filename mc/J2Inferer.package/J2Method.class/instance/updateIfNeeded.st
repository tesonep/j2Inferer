updating
updateIfNeeded
	self isUpdated 
		ifFalse:
			[ 
			self inferer notifier openingMethod: self.
			self cleanForUpdate.
			J2AstVisitor new
				method: self;
				visitNode: self method ast.
			updated := true.
			self inferer notifier openMethod: self ]