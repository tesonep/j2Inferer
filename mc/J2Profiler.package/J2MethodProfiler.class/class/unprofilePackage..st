as yet unclassified
unprofilePackage: aPackageName
	| pck |
	pck := RPackageOrganizer default packageNamed: aPackageName.
	pck classes do: [ :c | self unprofileClass: c ]