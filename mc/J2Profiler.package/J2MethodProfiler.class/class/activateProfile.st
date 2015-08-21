as yet unclassified
activateProfile
	active := true.
	file := File openFileNamed: 'profile.out'.
	stream := file writeStream.
	stream << 'Profile activated.'.
	stream crlf.
	stream flush.