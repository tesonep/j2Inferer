#!/bin/bash 

set -ex

wget --quiet -O - get.pharo.org/50+vm | bash

./pharo Pharo.image eval --save "
Metacello new 
	baseline: 'FFINB';
	repository: 'filetree://./mc';
	load.
"

./pharo Pharo.image test --fail-on-failure "FFI-NB.*"
