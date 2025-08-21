Extension { #name : 'FASTTypeScriptAssignmentExpression' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptAssignmentExpression >> famixVariable [
	"Relation named: #famixVariable type: #FamixTypeScriptAccess opposite: #fastAssignment"

	<generated>
	<derived>
	<FMProperty: #famixVariable type: #FamixTypeScriptAccess opposite: #fastAssignment>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famixVariable ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptAssignmentExpression >> famixVariable: anObject [

	<generated>
	(self attributeAt: #famixVariable ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self famixVariable.
		self attributeAt: #famixVariable put: anObject.
		otherSide fastAssignment: nil ]
	ifNotNil: [ 
		self attributeAt: #famixVariable put: anObject.
		anObject fastAssignment: self ]
]
