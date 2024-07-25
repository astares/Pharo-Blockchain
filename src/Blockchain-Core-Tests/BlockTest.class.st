"
A BlockTest is a test class for testing the behavior of Block
"
Class {
	#name : 'BlockTest',
	#superclass : 'TestCase',
	#category : 'Blockchain-Core-Tests-Base',
	#package : 'Blockchain-Core-Tests',
	#tag : 'Base'
}

{ #category : 'tests' }
BlockTest >> testGenesisBlock [

	| block |
	block := Block new
		         index: 0;
		         previousHash: '0';
		         data: 'Genesis Block'.
		
	self assert: block hash size equals: 64
]
