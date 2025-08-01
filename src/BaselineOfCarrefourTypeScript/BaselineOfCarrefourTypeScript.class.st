Class {
	#name : 'BaselineOfCarrefourTypeScript',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfCarrefourTypeScript',
	#package : 'BaselineOfCarrefourTypeScript'
}

{ #category : 'baselines' }
BaselineOfCarrefourTypeScript >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec description:
			'Developement version of CarrefourTypeScript which links FamixTypeScript with FASTTypeScript'.
		spec author: 'AlessHosry'.
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'accessing' }
BaselineOfCarrefourTypeScript >> customProjectAttributes [

	^ PackageOrganizer default packages
		  detect: [ :package |
		  package name = 'BaselineOfCarrefourTypeScript' ]
		  ifFound: [ #(  ) ]
		  ifNone: [ #( #NeedsMoose ) ]
]

{ #category : 'baselines' }
BaselineOfCarrefourTypeScript >> defineDependencies: spec [

spec baseline: 'FASTTypeScript' with: [
		spec
			loads: #( 'default' );
			repository: 'github://moosetechnology/FASTTypescript:main' ].
		
spec baseline: 'FamixTypeScript' with: [
		spec
			loads: #( 'default' );
			repository: 'github://fuhrmanator/FamixTypeScript:master/src' ].
	
]

{ #category : 'baselines' }
BaselineOfCarrefourTypeScript >> defineGroups: spec [

	spec
		group: 'core'
		with: #( 'Carrefour-TypeScript-Model' 'Carrefour-TypeScript-Model-Generator' )
]

{ #category : 'baselines' }
BaselineOfCarrefourTypeScript >> definePackages: spec [

	spec
		package: 'Carrefour-TypeScript-Model'
		with: [ spec requires: #( 'FASTTypeScript' 'FamixTypeScript' ) ];
		package: 'Carrefour-TypeScript-Model-Generator' .

	"In case of no Famix loaded"
	spec for: #NeedsMoose do: [
		spec
			package: 'Carrefour-TypeScript-Model'
			with: [ spec requires: #( 'FASTTypeScript' 'FamixTypeScript' ) ] ]
]
