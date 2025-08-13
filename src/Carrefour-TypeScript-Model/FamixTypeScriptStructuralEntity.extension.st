Extension { #name : 'FamixTypeScriptStructuralEntity' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptStructuralEntity >> fastAssignment [
	"Relation named: #fastAssignment type: #FASTTypeScriptAssignmentExpression opposite: #famixVariable"

	<generated>
	<derived>
	<FMProperty: #fastAssignment type: #FASTTypeScriptAssignmentExpression opposite: #famixVariable>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #fastAssignment ifAbsentPut: [ FMMultivalueLink on: self opposite: #famixVariable: ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FamixTypeScriptStructuralEntity >> fastAssignment: anObject [

	<generated>
	self fastAssignment value: anObject
]
