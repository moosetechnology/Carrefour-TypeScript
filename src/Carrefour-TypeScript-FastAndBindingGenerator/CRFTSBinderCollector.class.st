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
