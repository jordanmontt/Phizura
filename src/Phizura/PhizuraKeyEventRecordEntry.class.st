Class {
	#name : 'PhizuraKeyEventRecordEntry',
	#superclass : 'PhizuraBasicRecordEntry',
	#instVars : [
		'key'
	],
	#category : 'Phizura',
	#package : 'Phizura'
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
