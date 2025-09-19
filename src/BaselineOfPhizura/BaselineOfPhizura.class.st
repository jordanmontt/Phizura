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
		spec baseline: 'MethodProxies' with: [ spec repository: 'github://pharo-contributions/MethodProxies' ].
		"spec baseline: 'Coypu' with: [ spec repository: 'github://lucretiomsp/coypu:master' ]."

		"Packages"
		spec package: 'Phizura' with: [ spec requires: #( 'MethodProxies' "'Coypu'" ) ].
		spec package: 'Phizura-Playground' with: [ spec requires: #( 'Phizura' ) ].
		spec package: 'Phizura-Tests' with: [ spec requires: #( 'Phizura' ) ].

		"Groups"
		spec group: 'default' with: #( 'core' 'tests' ).
		spec group: 'core' with: #( 'Phizura' 'Phizura-Playground' ).
		spec group: 'tests' with: #( 'Phizura-Tests' ) ]
]
