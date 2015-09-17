initialization
for: anElement using: anInferer
	super for: anElement using: anInferer.
	classes := anElement classes collect:[:c | IBClass for:(anInferer typeInfoFor: c)].