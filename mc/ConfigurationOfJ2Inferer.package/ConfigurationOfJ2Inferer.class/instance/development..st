symbolic versions
development: spec
	<symbolicVersion: #development>
	spec
		for: #common
		do: [ 
			spec version: '0.1-baseline'.
			spec repository: 'filetree://./mc' ]