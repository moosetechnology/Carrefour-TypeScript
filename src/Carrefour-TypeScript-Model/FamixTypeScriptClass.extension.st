Extension { #name : 'FamixTypeScriptClass' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptClass >> fast [
	"Relation named: #fast type: #FASTTypeScriptClassDeclaration opposite: #famix"

	<generated>
	<FMProperty: #fast type: #FASTTypeScriptClassDeclaration opposite: #famix>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #fast ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptClass >> fast: anObject [

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
