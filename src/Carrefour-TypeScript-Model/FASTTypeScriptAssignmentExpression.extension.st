Extension { #name : 'FASTTypeScriptAssignmentExpression' }

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptAssignmentExpression >> famixVariable [
	"Relation named: #famixVariable type: #FamixTypeScriptStructuralEntity opposite: #fastAssignment"

	<generated>
	<FMProperty: #famixVariable type: #FamixTypeScriptStructuralEntity opposite: #fastAssignment>
	<package: #'Carrefour-TypeScript-Model'>
	^ self attributeAt: #famixVariable ifAbsent: [ nil ]
]

{ #category : '*Carrefour-TypeScript-Model-accessing' }
FASTTypeScriptAssignmentExpression >> famixVariable: anObject [

	<generated>
	self attributeAt: #famixVariable put: (FMMultivalueLink on: self update: #fastAssignment from: self famixVariable to: anObject).
]
