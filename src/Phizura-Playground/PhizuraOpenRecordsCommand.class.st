"
I will open the records in a new Playground, rady to be executed
"
Class {
	#name : 'PhizuraOpenRecordsCommand',
	#superclass : 'PhizuraOpenPlaygroundAbstractCommand',
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

{ #category : 'accessing' }
PhizuraOpenRecordsCommand class >> order [

    ^ 105
]

{ #category : 'executing' }
PhizuraOpenRecordsCommand >> execute [

	self openPhizuraPlaygroundOn:
		(self surroundCodeWithForkBlock: PhiRecorderInstance emitPerformanceCode)
]
