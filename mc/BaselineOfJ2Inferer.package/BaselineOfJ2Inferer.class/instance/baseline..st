api projectSpec
baseline: spec
	<baseline>
	spec
		for: #pharo
		do:
			[ 
			spec
				package: 'J2Inferer-Implementors';
				package: 'J2Inferer' with: [spec requires: #('J2Inferer-Implementors') ];
				package: 'J2Inferer-Stats' with: [spec requires: #('J2Inferer') ];
				package: 'J2Inferer-Tests' with: [spec requires: #('J2Inferer' 'J2Inferer-Tests-TestCode') ];
				package: 'J2Inferer-Tests-TestCode';
				package: 'InfererBrowser'  with: [spec requires: #('J2Inferer') ].
			spec
				group: 'core' with: #('J2Inferer' 'J2Inferer-Stats' 'J2Inferer-Implementors');
				group: 'ui'  with: #('InfererBrowser');
				group: 'dev' with: #('core' 'tests' 'ui');
				group: 'tests' with: #('J2Inferer-Tests' 'J2Inferer-Tests-TestCode') ]