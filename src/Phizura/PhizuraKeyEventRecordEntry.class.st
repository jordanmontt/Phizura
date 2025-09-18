Class {
	#name : 'PhizuraKeyEventRecordEntry',
	#superclass : 'PhizuraBasicRecordEntry',
	#instVars : [
		'key'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'testing' }
PhizuraKeyEventRecordEntry >> isKeyEntryRecord [

    ^ true
]

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> key: aKey [

    key := aKey
]
