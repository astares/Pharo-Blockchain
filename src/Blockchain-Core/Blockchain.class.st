"
The blockchain
"
Class {
	#name : 'Blockchain',
	#superclass : 'Object',
	#instVars : [
		'chain'
	],
	#category : 'Blockchain-Core-Base',
	#package : 'Blockchain-Core',
	#tag : 'Base'
}

{ #category : 'initialization' }
Blockchain >> addBlock: newBlock [
    newBlock
        index: self latestBlock index + 1;
        previousHash: self latestBlock hash.
    chain add: newBlock
]

{ #category : 'initialization' }
Blockchain >> addGenesisBlock [
    | genesisBlock |
    genesisBlock := Block new
        index: 0;
        previousHash: '0';
        data: 'Genesis Block'.
    chain add: genesisBlock
]

{ #category : 'accessing' }
Blockchain >> chain [

	^ chain
]

{ #category : 'accessing' }
Blockchain >> chain: anObject [

	chain := anObject
]

{ #category : 'initialization' }
Blockchain >> initialize [
    super initialize.
    chain := OrderedCollection new.
    self addGenesisBlock
]

{ #category : 'initialization' }
Blockchain >> isValid [
    2 to: chain size do: [ :i |
        | currentBlock previousBlock |
        currentBlock := chain at: i.
        previousBlock := chain at: i - 1.
        (currentBlock previousHash = previousBlock hash and: 
         [currentBlock hash = currentBlock calculateHash])
            ifFalse: [ ^ false ]
    ].
    ^ true
]

{ #category : 'initialization' }
Blockchain >> latestBlock [
    ^ chain last
]
