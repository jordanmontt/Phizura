Class {
	#name : 'PhizuraPlaygroundPresenter',
	#superclass : 'StPlaygroundPresenter',
	#instVars : [
		'playgroundPage',
		'recorder'
	],
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'initialization' }
PhizuraPlaygroundPresenter >> initialize [

    super initialize.
    playgroundPage := PhizuraPlaygroundPage new
]

{ #category : 'initialization' }
PhizuraPlaygroundPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		whenClosedDo: [ PhiRecorderInstance stopRecording ]
]

{ #category : 'private - factory' }
PhizuraPlaygroundPresenter >> newDefaultPlaygroundPage [

	^  PhizuraPlaygroundPage new
]
