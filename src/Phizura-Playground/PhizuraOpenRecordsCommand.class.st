"
I will open the records in a new Playground, rady to be executed
"
Class {
	#name : 'PhizuraOpenRecordsCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Commands',
	#package : 'Phizura-Playground',
	#tag : 'Commands'
}

{ #category : 'default' }
PhizuraOpenRecordsCommand class >> defaultDescription [

	^ 'Open the executable recording in a new Playground'
]

{ #category : 'accessing' }
PhizuraOpenRecordsCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : 'default' }
PhizuraOpenRecordsCommand class >> defaultName [

	^ 'Open Records'
]

{ #category : 'executing' }
PhizuraOpenRecordsCommand >> execute [

	| generatedCode |
	generatedCode := WriteStream on: String new.
	generatedCode << $[ << String cr << PhiRecorderInstance emitCleanCode
	<< String cr << $] << ' fork '.
	(PhizuraPlaygroundPresenter new contents: generatedCode contents)
		open
]
