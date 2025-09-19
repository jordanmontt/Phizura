Class {
	#name : 'PhizuraPlayground',
	#superclass : 'Object',
	#classInstVars : [
		'playground'
	],
	#category : 'Phizura-Playground-Model',
	#package : 'Phizura-Playground',
	#tag : 'Model'
}

{ #category : 'class initialization' }
PhizuraPlayground class >> initialize [

    Smalltalk globals at: #PhiRecorderInstance put: PhizuraRecorder new
]

{ #category : 'as yet unclassified' }
PhizuraPlayground class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	
	(aBuilder item: #'Phizura')
		order: -1;
		icon: (self iconNamed: #smallNew);
		keyText: 'o, h';
		help: 'Phizura playground is a special Playground to record Coypu.';
		action: [ self open ]
]

{ #category : 'api' }
PhizuraPlayground class >> open [

    PhiRecorderInstance stopRecording.

    playground := PhizuraPlaygroundPresenter new.
    playground open
]
