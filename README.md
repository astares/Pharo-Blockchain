# Pharo-Blockchain
A minimalistic blockchain written in Pharo

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


!Implementation

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
