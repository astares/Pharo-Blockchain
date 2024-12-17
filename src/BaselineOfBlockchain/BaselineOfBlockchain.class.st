"
Baseline for [https://github.com/astares/Pharo-Blockchain/](https://github.com/astares/Pharo-Blockchain/)
"
Class {
	#name : 'BaselineOfBlockchain',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBlockchain',
	#package : 'BaselineOfBlockchain'
}

{ #category : 'baselines' }
BaselineOfBlockchain >> baseline: spec [

	<baseline>
	spec for: #common do: [	 
		"Packages"
		spec 
			package: 'Blockchain-Core';
			package: 'Blockchain-Core-Tests' with: [ spec requires: #( 'Blockchain-Core' ) ].
		
		"Custom Groups"	
		spec
			group: 'Core' with: #( 'Blockchain-Core' );
			group: 'Tests' with: #( 'Blockchain-Core-Tests' ).						

		"Standard Groups"	
		spec group: 'default' with: #( 'Core' 'Tests').	
		spec group: 'all' with: #( 'default').
	]
]
