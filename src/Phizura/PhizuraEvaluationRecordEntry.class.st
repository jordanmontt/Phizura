Class {
	#name : 'PhizuraEvaluationRecordEntry',
	#superclass : 'PhizuraBasicRecordEntry',
	#instVars : [
		'expression'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'printing' }
PhizuraEvaluationRecordEntry >> emitCode [

    ^ expression
]

{ #category : 'accessing' }
PhizuraEvaluationRecordEntry >> expression [

	^ expression
]

{ #category : 'accessing' }
PhizuraEvaluationRecordEntry >> expression: aString [

	expression := aString
]

{ #category : 'printing' }
PhizuraEvaluationRecordEntry >> printOn: aStream [

    aStream << self emitCode << ' - ' << time asString
]
