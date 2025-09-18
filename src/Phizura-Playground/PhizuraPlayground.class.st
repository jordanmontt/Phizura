Class {
	#name : 'PhizuraPlayground',
	#superclass : 'Object',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'as yet unclassified' }
PhizuraPlayground class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'Phizura')
		order: -1;
		icon: (self iconNamed: #smallNew);
		keyText: 'o, h';
		help: 'Phizura playground is a special Playground to record Coypu.';
		action: [ self openPhizuraPlayground ]
]

{ #category : 'api' }
PhizuraPlayground class >> openPhizuraPlayground [

    ^ PhizuraPlaygroundPresenter new open
]
