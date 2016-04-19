# j2Inferer - An Inferer Tool for Pharo 

j2Inferer is a Type Inference tool for Pharo, the idea is provide information about all the elements in the system:

  - Classes
  - Methods
  - Instance Variables
  - Parameters
  - Return values
  - Temporary Variables
  
This information is extracted in a static way, only analyzing the source code. 
This tool is intended to be used with any program written for Pharo, and it is not needed to add extra type information.
As not all the information can be extracted the tool uses this information knowing that is incomplete, but never erroneous.

The tool try to identify all the relationships between the elements and the possible interactions.

The information is generated in a incremental way, adding more information with each class analyzed.

The tool can give concrete type information of the elements, if the information is enough.

Also, heuristics are applied to understand some programs reflecting the common behavior of Pharo programs and idiomatic elements of Smalltalk.

The idea of this tool is not to provide type checking to Pharo, but to provide the programmer with more information about the program being edited.

In the worst scenario the tool can not say nothing about a given element. 

# How does it work?

- The program is analyzed based in its AST representation.
- Each element in the program is given a type variable. 
- The relationships between this elements are recorded in the type variables, forming a graph of relationships.
- Each type variable records two distinct type information:
  - The known concrete types that have relationship with this type variable. This creates a Set of minimal concrete classes that describes the type variable. This is called *Min Type* 
  - The message sent to this variable. This Set of messages can restrict the whole universe of concrete classes, to the ones that can be used in this context. This is called *Max Type*
  - With this information we can approach to have the Type of the element, as the real type of the element is restricted by both the Min and Max type.
  
- The information is generated in a incremental way, the idea is to generate all the information at once and then after a modification of a method or class, recalculates only the missing part.
- Any time the tool is queried the graph is traversed, only taking the elements which participates in this part of the program, and the information is calculated.
- The information is stored in memory, but a way of externalize it and internalize it again is present.

# Heuristics

In order to get more information from the program, as there is no desire of using type annotations. Some heuristics have been used to fill this gap. 
All the heuristics are based in known behavior of a Smalltalk program and some special messages and classes in the system.
The process can work without this heuristics, but the amount of information generated differs a lot.

They are also used to manage the different primitive calls.

The heuristics implemented so far are:

- Handling of the #basicNew message.
- Arithmetic operations between subclasses of Number
- Evaluation of a block.
- Detecting Collections based in known classes (trying to remove it).

All this scenarios provides more information than the present in the code itself, so it is very useful.

# Possible Extensions

- Divide the graph in different subgraphs.
- Perform On-Demand loading of parts of the graph.
- Implement more heuristics for different known scenarios.
- Detecting collections through the use of array primitives

# Presentation
I have a small presentation of the work and the ideas behind it, maybe it can be useful. It's about an older version, but most of the background information is still useful.

[Presentation](presentation/main.pdf)

# Installing.

Checkout the current repository. And perform:

- wget -O - get.pharo.org/50+vm | bash
- ./scripts/install-packages.sh

You can load it also from the image:

Metacello new 
	baseline: 'J2Inferer';
	repository: 'filetree://./mc';
	load.

The package is bundled with tests, to run them:

- ./pharo Pharo.image test --fail-on-failure "J2Inferer-Tests"

If you want to generate the initial data perform:

- ./scripts/generate-typeInfo.sh

# Travis integration

The testing of this package is automated by the use of Travis CI (https://travis-ci.org/search/j2inferer)

Current Status: [![Build Status](https://travis-ci.org/tesonep/j2Inferer.svg?branch=master)](https://travis-ci.org/tesonep/j2Inferer)
