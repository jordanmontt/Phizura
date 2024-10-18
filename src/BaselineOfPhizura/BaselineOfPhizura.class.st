Class {
	#name : 'BaselineOfPhizura',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPhizura',
	#package : 'BaselineOfPhizura'
}

{ #category : 'baselines' }
BaselineOfPhizura >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"External Dependencies"
		spec baseline: 'MethodProxies'
			with: [ spec repository: 'github://pharo-contributions/MethodProxies' ].
		spec baseline: 'NeoJSON' with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
		"spec baseline: 'Coypu' with: [ spec repository: 'github://lucretiomsp/coypu:master' ]."

		"Packages"
		spec package: 'Phizura' with: [ spec requires: #( 'MethodProxies' "'Coypu'" 'NeoJSON' ) ].

		"Groups"
		spec group: 'default' with: #( 'core' 'tests' ).
		spec group: 'core' with: #( 'Phizura' ).
		spec group: 'tests' with: #( ) ]
]
