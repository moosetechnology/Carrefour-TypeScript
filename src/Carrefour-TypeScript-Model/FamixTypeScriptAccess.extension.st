Extension { #name : 'FamixTypeScriptAccess' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptAccess >> fastAssignment [
	"Relation named: #fastAssignment type: #FASTTypeScriptAssignmentExpression opposite: #famixVariable"

	<generated>
	<FMProperty: #fastAssignment type: #FASTTypeScriptAssignmentExpression opposite: #famixVariable>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #fastAssignment ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptAccess >> fastAssignment: anObject [

	<generated>
	(self attributeAt: #fastAssignment ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self fastAssignment.
		self attributeAt: #fastAssignment put: anObject.
		otherSide famixVariable: nil ]
	ifNotNil: [ 
		self attributeAt: #fastAssignment put: anObject.
		anObject famixVariable: self ]
]
