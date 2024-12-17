[![Pharo 7](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 8](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 9](https://img.shields.io/badge/Pharo-9.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)

# Pharo-Blockchain
A minimalistic blockchain written in Pharo

## Quick Start
### Install

You can install **Blockchain** by executing the following load scripts:

```Smalltalk
Metacello new 
	repository: 'github://astares/Pharo-Blockchain:main/src';
	baseline: 'Blockchain';
	load 	
```	

### Use the blockchain
```Smalltalk
| blockchain |
blockchain := Blockchain new.
blockchain addBlock: (Block new data: 'First Block').
blockchain addBlock: (Block new data: 'Second Block').
self assert: blockchain isValid.
	
"Manipulation"
blockchain chain second data: 'Manipulated'.	
self deny: blockchain isValid
```


## Implementation

The **Blockchain class** represents individual blocks in the chain. Each block has:
- an index
- a timestamp
- data (which can be any object)
- the hash of the previous block
- its own hash

The **Blockchain class** manages the chain of blocks. It includes methods to:
- initialize the chain with a genesis block
- add new blocks
- validate the integrity of the chain
