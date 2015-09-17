infering
inferMethod: aMethod
	inferer inferMethod: aMethod.
	^ (inferer typeInfoFor: aMethod methodClass)
		methodTypeFor: aMethod