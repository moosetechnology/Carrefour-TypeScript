Class {
	#name : 'CRFTSBinderCollector',
	#superclass : 'FASTTypeScriptVisitor',
	#category : 'Carrefour-TypeScript-FastAndBindingGenerator',
	#package : 'Carrefour-TypeScript-FastAndBindingGenerator'
}

{ #category : 'as yet unclassified' }
CRFTSBinderCollector >> collectClass: fastClassName from: famixEntity [
 
	(famixEntity class = FamixTypeScriptClass 
		and: [ famixEntity name = fastClassName ])
		ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTClass)
		detect: [ :class | 
			class isAnonymousClass not 
				and: [ class name = fastClassName ] ]
		ifNone: [ nil ]

]

{ #category : 'as yet unclassified' }
CRFTSBinderCollector >> collectEnum: fastEnumName from: famixEntity [

	(famixEntity class = FamixTypeScriptEnum and: [
		 famixEntity name = fastEnumName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTEnum)
		  detect: [ :enum |
			  enum isAnonymous not and: [ enum name = fastEnumName ] ]
		  ifNone: [ nil ]
]

{ #category : 'as yet unclassified' }
CRFTSBinderCollector >> collectFunction: fastFunctionName from: famixEntity [

	(famixEntity class = FamixTypeScriptFunction and: [
		 famixEntity name = fastFunctionName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTFunction )
		  detect: [ :function |
			  function isAnonymous not and: [ function name = fastFunctionName ] ]
		  ifNone: [ nil ]
]
