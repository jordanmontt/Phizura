Class {
	#name : 'PhizuraInstrumentor',
	#superclass : 'Object',
	#instVars : [
		'recorder',
		'proxyVariables'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'initialization' }
PhizuraInstrumentor >> initialize [

	super initialize.
	self initializeProxyVariables.
"	self initializeMethodProxies"
]

{ #category : 'initialization' }
PhizuraInstrumentor >> initializeProxyVariables [

    proxyVariables := OrderedCollection new
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
PhizuraInstrumentor >> proxyVariables [

	^ proxyVariables 
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
