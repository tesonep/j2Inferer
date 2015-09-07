api projectSpec
baseline: spec
	<baseline>
	spec
		for: #pharo
		do:
			[ 
			spec
				package: 'J2Inferer';
				package: 'J2Inferer-Stats'.
			spec
				group: 'core' with: #('J2Inferer' 'J2Inferer-Stats');
				group: 'dev' with: #('core' 'tests');
				group: 'tests' with: #() ]