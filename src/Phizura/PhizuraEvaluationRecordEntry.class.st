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
PhizuraEvaluationRecordEntry >> emitMoofLODCodeOnEmitter: emitter onStream: aStream [

	emitter emitMoofLODExpression: self on: aStream
]

{ #category : 'accessing' }
PhizuraEvaluationRecordEntry >> emitPerformanceCodeOnEmitter: emitter onStream: aStream [

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
