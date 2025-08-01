Extension { #name : 'FamixTypeScriptEnum' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptEnum >> fast [
	"Relation named: #fast type: #FASTTypeScriptEnumDeclaration opposite: #famix"

	<generated>
	<FMProperty: #fast type: #FASTTypeScriptEnumDeclaration opposite: #famix>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #fast ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptEnum >> fast: anObject [

	<generated>
	(self attributeAt: #fast ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self fast.
		self attributeAt: #fast put: anObject.
		otherSide famix: nil ]
	ifNotNil: [ 
		self attributeAt: #fast put: anObject.
		anObject famix: self ]
]
