#!/bin/bash 

set -ex

cp Pharo.image inference.image
cp Pharo.changes inference.changes

./pharo inference.image eval --save "
Metacello new 
	baseline: 'J2Inferer';
	repository: 'filetree://./mc';
	load.
"

./pharo inference.image eval --save "
  J2InferenceManager inferAllInstalation.
"


./pharo inference.image eval --save "
  J2InferenceManager serializeToFile: 'typeInfo.fuel.gz'.
"
