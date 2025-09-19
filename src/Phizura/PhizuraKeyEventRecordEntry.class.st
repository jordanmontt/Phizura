Class {
	#name : 'PhizuraKeyEventRecordEntry',
	#superclass : 'PhizuraBasicRecordEntry',
	#instVars : [
		'key'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> emitOnEmitter: emitter onStream: aStream [

    emitter emitKeyStroke: self on: aStream
]

{ #category : 'testing' }
PhizuraKeyEventRecordEntry >> isKeyEntryRecord [

    ^ true
]

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> key [
	^ key
]

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> key: aKey [

    key := aKey
]

{ #category : 'printing' }
PhizuraKeyEventRecordEntry >> printOn: aStream [

    aStream << 'KEY - '.
    self key asString printOn: aStream
]
