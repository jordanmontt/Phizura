Class {
	#name : 'PhizuraInstrumentor',
	#superclass : 'Object',
	#instVars : [
		'recorder',
		'coypuEvaluate'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'instance creation' }
PhizuraInstrumentor class >> onRecorder: aRecorder [

	^ self basicNew
		  recorder: aRecorder;
		  initialize;
		  yourself
]

{ #category : 'initialization' }
PhizuraInstrumentor >> initialize [

	super initialize.
	self initializeMethodProxies
]

{ #category : 'initialization' }
PhizuraInstrumentor >> initializeMethodProxies [

	coypuEvaluate := MpMethodProxy
		onMethod: SpCodeMooflodEvaluateCommand >> #executeCode:
		handler: self phizuraHandler
]

{ #category : 'api' }
PhizuraInstrumentor >> instrument [

	self proxyVariables do: #install.
	MpMethodProxy enableInstrumentation
]

{ #category : 'instrumentation' }
PhizuraInstrumentor >> phizuraHandler [

	^ PhizuraHandler onRecorder: recorder
]

{ #category : 'instrumentation' }
PhizuraInstrumentor >> proxyVariables [ self flag:

	'IMPORTANT: Here one needs to return all the instances variables that hold a proxy.'.
	^ { coypuEvaluate }
]

{ #category : 'accessing' }
PhizuraInstrumentor >> recorder: aRecorder [

	recorder := aRecorder
]

{ #category : 'api' }
PhizuraInstrumentor >> uninstrument [

	self proxyVariables do: #uninstall.
	MpMethodProxy disableInstrumentation
]
