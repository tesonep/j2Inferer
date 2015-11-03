executing
execute
   | cls |
	cls := method methodClass.
	(self inferer typeInfoFor: cls) updateMethod: method.
