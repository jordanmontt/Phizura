"
I will open the records in a new Playground, rady to be executed
"
Class {
	#name : 'PhizuraOpenMoofLODCommand',
	#superclass : 'PhizuraOpenPlaygroundAbstractCommand',
	#category : 'Phizura-Playground-Commands',
	#package : 'Phizura-Playground',
	#tag : 'Commands'
}

{ #category : 'default' }
PhizuraOpenMoofLODCommand class >> defaultDescription [

	^ 'Open the records (including OSC messages) in a new Playground'
]

{ #category : 'accessing' }
PhizuraOpenMoofLODCommand class >> defaultIconName [

	^ #smallExport
]

{ #category : 'default' }
PhizuraOpenMoofLODCommand class >> defaultName [

	^ 'Open MoofLOD'
]

{ #category : 'accessing' }
PhizuraOpenMoofLODCommand class >> order [

    ^ 104
]

{ #category : 'executing' }
PhizuraOpenMoofLODCommand >> execute [

	self openPhizuraPlaygroundOn:
		(self surroundCodeWithForkBlock: PhiRecorderInstance emitCode)
]
