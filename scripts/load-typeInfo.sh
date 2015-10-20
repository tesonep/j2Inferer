#!/bin/bash 

set -ex

cp Pharo.image loaded.image
cp Pharo.changes loaded.changes

./pharo loaded.image eval --save "
Metacello new 
	baseline: 'J2Inferer';
	repository: 'filetree://./mc';
	load.
"

./pharo loaded.image eval --save "
  J2InferenceManager deserializeFromFile:'typeInfo.fuel.gz'.
"
