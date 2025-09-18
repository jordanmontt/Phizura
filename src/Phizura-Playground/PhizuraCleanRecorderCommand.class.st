"
I'm a ""do it and inspect"" command.
I will select all contents of a playground and I will execute it, inspecting the result.
"
Class {
	#name : 'PhizuraCleanRecorderCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'default' }
PhizuraCleanRecorderCommand class >> defaultDescription [

	^ 'Clean the recorder and the records'
]

{ #category : 'accessing' }
PhizuraCleanRecorderCommand class >> defaultIconName [

	^ #glamorousRefresh
]

{ #category : 'default' }
PhizuraCleanRecorderCommand class >> defaultName [

	^ 'Clean Phizura'
]

{ #category : 'accessing' }
PhizuraCleanRecorderCommand class >> order [

    ^ 102
]

{ #category : 'executing' }
PhizuraCleanRecorderCommand >> execute [

    PhiRecorderInstance stopRecording.
    PhiRecorderInstance := PhizuraRecorder new
]
