"
I'm a ""do it and inspect"" command.
I will select all contents of a playground and I will execute it, inspecting the result.
"
Class {
	#name : 'PhizuraInspectRecorderCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Commands',
	#package : 'Phizura-Playground',
	#tag : 'Commands'
}

{ #category : 'default' }
PhizuraInspectRecorderCommand class >> defaultDescription [

	^ 'Inspect Phizura'
]

{ #category : 'accessing' }
PhizuraInspectRecorderCommand class >> defaultIconName [

	^ #inspect
]

{ #category : 'default' }
PhizuraInspectRecorderCommand class >> defaultName [

	^ 'Inspect Phizura'
]

{ #category : 'accessing' }
PhizuraInspectRecorderCommand class >> order [

    ^ 104
]

{ #category : 'executing' }
PhizuraInspectRecorderCommand >> execute [

    PhiRecorderInstance inspect
]
