as yet unclassified
profilePackage: aPackageName
	| pck |
	pck := RPackageOrganizer default packageNamed: aPackageName. pck classes do: [ :c | self profileClass: c ]