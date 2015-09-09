as yet unclassified
fillPackages: packages from: inferer
	dateTime := DateAndTime new.
	results := IdentitySet new.
	
	packages 
		do: [ :each | self calculatePackage: each from:inferer ] 
		displayingProgress: [ :each | each name ].