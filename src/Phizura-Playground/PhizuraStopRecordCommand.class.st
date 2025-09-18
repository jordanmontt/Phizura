"
I'm a ""do it and inspect"" command.
I will select all contents of a playground and I will execute it, inspecting the result.
"
Class {
	#name : 'PhizuraStopRecordCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'default' }
PhizuraStopRecordCommand class >> defaultDescription [

	^ 'Stop recording'
]

{ #category : 'accessing' }
PhizuraStopRecordCommand class >> defaultIconName [

	^ #cancel
]

{ #category : 'default' }
PhizuraStopRecordCommand class >> defaultName [

	^ 'Stop Phizureada'
]

{ #category : 'accessing' }
PhizuraStopRecordCommand class >> order [

    ^ 101
]

{ #category : 'executing' }
PhizuraStopRecordCommand >> execute [

    PhiRecorderInstance stopRecording
]
