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

	^ 'Open the records in a new Playground'
]

{ #category : 'accessing' }
PhizuraOpenRecordsCommand class >> defaultIconName [

	^ #rightSide
]

{ #category : 'default' }
PhizuraOpenRecordsCommand class >> defaultName [

	^ 'Open Records'
]

{ #category : 'executing' }
PhizuraOpenRecordsCommand >> execute [

( StPlaygroundPresenter new contents:  PhiRecorderInstance emitCode) open
]
