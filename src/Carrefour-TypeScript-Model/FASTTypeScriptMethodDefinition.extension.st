Extension { #name : 'FASTTypeScriptMethodDefinition' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptMethodDefinition >> famix [
	"Relation named: #famix type: #FamixTypeScriptMethod opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixTypeScriptMethod opposite: #fast>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptMethodDefinition >> famix: anObject [

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
