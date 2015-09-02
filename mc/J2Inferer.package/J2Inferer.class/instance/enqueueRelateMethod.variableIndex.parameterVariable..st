as yet unclassified
enqueueRelateMethod: aMethod variableIndex: index parameterVariable: parameterVariable
	queue
		enqueue:
			(J2RelateParametersTask new
				method: aMethod ;
				index: index;
				parameterVariable:parameterVariable;
				yourself)