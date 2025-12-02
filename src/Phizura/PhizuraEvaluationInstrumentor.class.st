Class {
	#name : 'PhizuraEvaluationInstrumentor',
	#superclass : 'PhizuraInstrumentor',
	#instVars : [
		'doItAndGo',
		'evaluateAndGo'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'initialization' }
PhizuraEvaluationInstrumentor >> initializeMethodProxies [

	evaluateAndGo := MpMethodProxy
		onMethod: SpCodeSelectionCommand >> #evaluate:andDo:
		handler: instrumentationHandler.
	doItAndGo := MpMethodProxy
		onMethod: PhizuraPlaygroundPagePresenter >> #doEvaluateAndGoFor:
		handler: instrumentationHandler.

	proxyVariables addAll: { evaluateAndGo . doItAndGo }
]
