accessing
add: aMethod
	| s |
	s := IdentitySet new: self methods size + 1.
	s addAll: self methods.
	s add: aMethod.
	methods := s asArray.