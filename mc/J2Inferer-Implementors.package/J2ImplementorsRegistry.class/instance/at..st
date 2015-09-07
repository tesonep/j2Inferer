as yet unclassified
at: aSymbol
	| nuevo |
	^ selectors
		like: aSymbol ifAbsent: [ 
			nuevo := J2Implementors new
				selector: aSymbol;
				yourself.
			selectors add:nuevo.
			^nuevo
		 ]