Class {
	#name : 'PhizuraRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time',
		'expression'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'printing' }
PhizuraRecordEntry >> emitCode [

    ^ expression
]

{ #category : 'accessing' }
PhizuraRecordEntry >> expression [

	^ expression
]

{ #category : 'accessing' }
PhizuraRecordEntry >> expression: aString [

	expression := aString
]

{ #category : 'printing' }
PhizuraRecordEntry >> printOn: aStream [

    aStream << self emitCode << ' - ' << time asString
]

{ #category : 'accessing' }
PhizuraRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
PhizuraRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
