Extension { #name : 'FASTTypeScriptEnumDeclaration' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptEnumDeclaration >> famix [
	"Relation named: #famix type: #FamixTypeScriptEnum opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixTypeScriptEnum opposite: #fast>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptEnumDeclaration >> famix: anObject [

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
