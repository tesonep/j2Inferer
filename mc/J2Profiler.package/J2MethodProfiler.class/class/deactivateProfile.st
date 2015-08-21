as yet unclassified
deactivateProfile
	self isProfileActive
		ifTrue: [ 
			stream << 'Profile deactivated'.
			stream crlf.
			stream close.
			file close. ].
	active := false.
	stream := nil.
	file := nil