"
I will open the records in a new Playground, rady to be executed
"
Class {
	#name : 'PhizuraToMoofLODCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Commands',
	#package : 'Phizura-Playground',
	#tag : 'Commands'
}

{ #category : 'default' }
PhizuraToMoofLODCommand class >> defaultDescription [

	^ 'Open the records (including OSC messages) in a new Playground'
]

{ #category : 'accessing' }
PhizuraToMoofLODCommand class >> defaultIconName [

	^ #rightSide
]

{ #category : 'default' }
PhizuraToMoofLODCommand class >> defaultName [

	^ 'To MoofLOD'
]

{ #category : 'executing' }
PhizuraToMoofLODCommand >> execute [

	(PhizuraPlaygroundPresenter new contents:
		 PhiRecorderInstance emitCode) open
]
