#!/bin/bash 

set -ex

./pharo Pharo.image eval --save "
Metacello new 
	baseline: 'J2Inferer';
	repository: 'filetree://./mc';
	load.
"

