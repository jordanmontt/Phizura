Class {
	#name : 'BaselineOfMpCoypuRecorder',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfMpCoypuRecorder',
	#package : 'BaselineOfMpCoypuRecorder'
}

{ #category : 'baselines' }
BaselineOfMpCoypuRecorder >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"External Dependencies"
		spec baseline: 'MethodProxies'
			with: [ spec repository: 'github://pharo-contributions/MethodProxies' ].
		spec baseline: 'Coypu'
			with: [ spec repository: 'github://lucretiomsp/coypu:master' ].

		"Packages"
		spec package: 'MpCoypuRecorder' with: [ spec requires: #( 'MethodProxies' 'Coypu' ) ].

		"Groups"
		spec group: 'default' with: #( 'core' 'tests' ).
		spec group: 'core' with: #( 'MpCoypuRecorder' ).
		spec group: 'tests' with: #( ) ]
]
