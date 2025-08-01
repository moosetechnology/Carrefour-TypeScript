Extension { #name : 'FASTTypeScriptClassDeclaration' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptClassDeclaration >> famix [
	"Relation named: #famix type: #FamixTypeScriptClass opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixTypeScriptClass opposite: #fast>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptClassDeclaration >> famix: anObject [

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
