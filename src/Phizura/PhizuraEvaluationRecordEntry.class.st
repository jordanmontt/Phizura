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

{ #category : 'accessing' }
PhizuraEvaluationRecordEntry >> emitCleanOnEmitter: emitter onStream: aStream [

	emitter emitCleanExpression: self on: aStream
]

{ #category : 'accessing' }
PhizuraEvaluationRecordEntry >> emitOnEmitter: emitter onStream: aStream [

    emitter emitExpression: self on: aStream
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

    aStream << 'EVALUATION - ' << self expression
]
