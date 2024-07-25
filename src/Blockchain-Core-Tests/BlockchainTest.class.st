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
