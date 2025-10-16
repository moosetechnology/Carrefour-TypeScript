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

	^ (famixEntity allToScope: FamixTEnum )
		  detect: [ :class |
			  class isAnonymousClass not and: [ class name = fastEnumName ] ]
		  ifNone: [ nil ]
]
