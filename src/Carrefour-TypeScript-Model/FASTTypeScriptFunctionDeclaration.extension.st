Extension { #name : 'FASTTypeScriptFunctionDeclaration' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptFunctionDeclaration >> famix [
	"Relation named: #famix type: #FamixTypeScriptFunction opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixTypeScriptFunction opposite: #fast>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptFunctionDeclaration >> famix: anObject [

	<generated>
	(self attributeAt: #famix ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self famix.
		self attributeAt: #famix put: anObject.
		otherSide fast: nil ]
	ifNotNil: [ 
		self attributeAt: #famix put: anObject.
		anObject fast: self ]
]
