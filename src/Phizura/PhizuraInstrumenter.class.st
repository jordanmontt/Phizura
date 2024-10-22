Class {
	#name : 'PhizuraInstrumenter',
	#superclass : 'Object',
	#instVars : [
		'recorder',
		'proxyActiveDSP',
		'proxyFreq',
		'proxyUniqueInstance',
		'proxyPerformer',
		'proxyMute',
		'proxyMuteAll',
		'proxySolo',
		'proxyPlay',
		'proxyStop',
		'proxyAtPut',
		'proxyPerformerArg'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'instance creation' }
PhizuraInstrumenter class >> onRecorder: aRecorder [
	
	^ self basicNew
		recorder: aRecorder;
		initialize;
		yourself
]

{ #category : 'instrumentation' }
PhizuraInstrumenter >> basicArgHandler [

	^ PhizuraBasicArgHandler onRecorder: recorder
]

{ #category : 'instrumentation' }
PhizuraInstrumenter >> basicHandler [

	^ PhizuraBasicHandler onRecorder: recorder
]

{ #category : 'initialization' }
PhizuraInstrumenter >> initialize [

	super initialize.
	self initializeMethodProxies
]

{ #category : 'initialization' }
PhizuraInstrumenter >> initializeMethodProxies [

	proxyActiveDSP := MpMethodProxy
		phizuraOnMethod: Performance >> #activeDSP: handler: self basicArgHandler.
	proxyFreq := MpMethodProxy
		phizuraOnMethod: Performance >> #freq: handler:  (PhizuraFreqHandler onRecorder: recorder).
	proxyPerformerArg := MpMethodProxy
		phizuraOnMethod: Performance >> #performer: handler: (PhizuraPerformerArgHandler onRecorder: recorder).
	proxyAtPut := MpMethodProxy
		phizuraOnMethod: Performance >> #at:put: handler: (PhizuraAtPutHandler onRecorder: recorder).
	proxyMute := MpMethodProxy
		phizuraOnMethod: Performance >> #mute: handler:  self basicArgHandler.
	proxyMuteAll := MpMethodProxy
		phizuraOnMethod: Performance >> #muteAll handler: self basicHandler.
	proxySolo := MpMethodProxy
		phizuraOnMethod: Performance >> #solo: handler: self basicArgHandler.
	proxyPlay := MpMethodProxy
		phizuraOnMethod: Performance >> #play handler: self basicHandler.
	proxyStop := MpMethodProxy
		phizuraOnMethod: Performance >> #stop handler: self basicHandler.
]

{ #category : 'api' }
PhizuraInstrumenter >> instrument [

	self proxyVariables do: #install
]

{ #category : 'instrumentation' }
PhizuraInstrumenter >> proxyVariables [

	self flag:
		'IMPORTANT: Here one needs to return all the instances variables that hold a proxy.'.
	^ {
		  proxyActiveDSP.
		  proxyFreq.
		  proxyUniqueInstance.
		  proxyPerformer.
		  proxyPerformerArg.
		  proxyMute.
		  proxyMuteAll.
		  proxySolo.
		  proxyPlay.
		  proxyStop.
		  proxyAtPut }
]

{ #category : 'api' }
PhizuraInstrumenter >> recorder: aRecorder [

	recorder := aRecorder
]

{ #category : 'api' }
PhizuraInstrumenter >> uninstrument [

	self proxyVariables do: #uninstall
]
