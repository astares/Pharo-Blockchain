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
