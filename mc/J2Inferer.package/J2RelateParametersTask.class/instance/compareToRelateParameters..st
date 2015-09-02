as yet unclassified
compareToRelateParameters: anotherTask
	^ anotherTask method = self method
		and:
			[ 
			anotherTask parameterVariable = self parameterVariable
				and: [ anotherTask index = self index ] ]