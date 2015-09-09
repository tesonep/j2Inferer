as yet unclassified
calculatePackage: package from: inferer
	| data | 
	data := J2PackageData new.
	data fillPackage: package from: inferer.
	results add:data.