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

{ #category : 'instance creation' }
Blockchain class >> initialData: aString [ 
	^(self new)
		addNewBlockWithData: aString;
		yourself
]

{ #category : 'private' }
Blockchain >> addBlock: newBlock [
	chain ifEmpty: [ 
		newBlock 
			index: 1;
			previousHash: ''.			
		 ]
	
	 ifNotEmpty: [ 
    newBlock
        index: self lastBlock index + 1;
        previousHash: self lastBlock hash ].

	newBlock rehash.
   chain add: newBlock
]

{ #category : 'initialization' }
Blockchain >> addNewBlockWithData: data [
    | block |
    block := Block new data: data.
    ^ self addBlock: block
]

{ #category : 'accessing' }
Blockchain >> chain [

	^ chain
]

{ #category : 'accessing' }
Blockchain >> chain: anObject [

	chain := anObject
]

{ #category : 'accessing' }
Blockchain >> genesisBlock [
	"Return the genesis block or nil for an empty chain"

	self chain ifEmpty: [ ^ nil ].	
	^ self chain first	
]

{ #category : 'initialization' }
Blockchain >> initialize [
    super initialize.
    chain := OrderedCollection new
]

{ #category : 'testing' }
Blockchain >> isEmpty [

	^ chain isEmptyOrNil 
]

{ #category : 'testing' }
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

{ #category : 'accessing' }
Blockchain >> lastBlock [
    ^ chain last
]
