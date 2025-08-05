Extension { #name : 'FASTTypeScriptInterfaceDeclaration' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptInterfaceDeclaration >> famix [
	"Relation named: #famix type: #FamixTypeScriptInterface opposite: #fast"

	<generated>
	<derived>
	<FMProperty: #famix type: #FamixTypeScriptInterface opposite: #fast>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famix ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptInterfaceDeclaration >> famix: anObject [

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
