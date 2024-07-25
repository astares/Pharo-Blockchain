"
A simple block in the blockchain
"
Class {
	#name : 'Block',
	#superclass : 'Object',
	#instVars : [
		'index',
		'timestamp',
		'data',
		'previousHash',
		'hash'
	],
	#category : 'Blockchain-Core-Base',
	#package : 'Blockchain-Core',
	#tag : 'Base'
}

{ #category : 'calculation' }
Block >> calculateHash [
    | stringToHash |
    stringToHash := self index asString, 
                    self timestamp asString, 
                    self data asString, 
                    self previousHash.
    ^ (SHA256 hashMessage: stringToHash) hex
]

{ #category : 'accessing' }
Block >> data [

	^ data
]

{ #category : 'accessing' }
Block >> data: anObject [

	data := anObject
]

{ #category : 'comparing' }
Block >> hash [

	 ^ hash ifNil: [ hash := self calculateHash ]
]

{ #category : 'accessing' }
Block >> hash: anObject [

	hash := anObject
]

{ #category : 'accessing' }
Block >> index [

	^ index
]

{ #category : 'accessing' }
Block >> index: anObject [

	index := anObject
]

{ #category : 'initialization' }
Block >> initialize [
    super initialize.
    self timestamp: DateAndTime now
]

{ #category : 'accessing' }
Block >> previousHash [

	^ previousHash
]

{ #category : 'accessing' }
Block >> previousHash: anObject [

	previousHash := anObject
]

{ #category : 'accessing' }
Block >> timestamp [

	^ timestamp
]

{ #category : 'accessing' }
Block >> timestamp: anObject [

	timestamp := anObject
]
