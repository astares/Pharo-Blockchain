"
A BlockchainTest is a test class for testing the behavior of Blockchain
"
Class {
	#name : 'BlockchainTest',
	#superclass : 'TestCase',
	#category : 'Blockchain-Core-Tests-Base',
	#package : 'Blockchain-Core-Tests',
	#tag : 'Base'
}

{ #category : 'tests' }
BlockchainTest >> testBlockChain [

	| blockchain |
	blockchain := Blockchain new.
	blockchain addBlock: (Block new data: 'First Block').
	blockchain addBlock: (Block new data: 'Second Block').
	self assert: blockchain isValid.
	
	"Manipulation"
	blockchain chain second data: 'Manipulated'.	
	self deny: blockchain isValid

]

{ #category : 'tests' }
BlockchainTest >> testGenesisBlock [ 

	|blockchain genesisBlock|
	blockchain := Blockchain initialData: 'Genesis data'.
	genesisBlock := blockchain genesisBlock.

	self 
		assert: genesisBlock notNil;
		assert: genesisBlock data equals: 'Genesis data'.	

	genesisBlock timestamp: (DateAndTime fromUnixTime: 1465154705).
	
	genesisBlock rehash.

	self assert: genesisBlock hash equals: 'a5b77a1755b584b3abd9c5b9179b5b086ad9d403f809f1319eff80915495158d'
]

{ #category : 'tests' }
BlockchainTest >> testNoGenesisBlock [ 

	|blockchain genesisBlock|
	blockchain := Blockchain new.
	genesisBlock := blockchain genesisBlock.

	self assert: blockchain isEmpty.
	self assert: genesisBlock isNil
 
]
