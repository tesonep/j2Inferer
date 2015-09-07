api projectSpec
baseline: spec
	<baseline>
	spec
		for: #pharo
		do:
			[ 
			spec
				package: 'J2Inferer';
				package: 'J2Inferer-Implementors';
				package: 'J2Inferer-Stats'.
			spec
				group: 'core' with: #('J2Inferer' 'J2Inferer-Stats' 'J2Inferer-Implementors');
				group: 'dev' with: #('core' 'tests');
				group: 'tests' with: #() ]