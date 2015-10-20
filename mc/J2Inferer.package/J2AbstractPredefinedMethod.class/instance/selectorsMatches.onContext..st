testing if can handle
selectorsMatches: aMessage onContext: aContext
	^ selectors isEmpty or: [ selectors includes: aMessage selector ]