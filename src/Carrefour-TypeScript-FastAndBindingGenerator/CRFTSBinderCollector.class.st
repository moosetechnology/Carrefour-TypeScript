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

{ #category : 'as yet unclassified' }
CRFTSBinderCollector >> collectInterface: fastInterfaceName from: famixEntity [

	(famixEntity class = FamixTypeScriptInterface and: [
		 famixEntity name = fastInterfaceName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTInheritance)
		  detect: [ :class |
			  class isAnonymous not and: [ class name = fastInterfaceName ] ]
		  ifNone: [ nil ]
]

{ #category : 'detecting' }
CRFTSBinderCollector >> collectMethod: fastMethod from: famixEntity [

	| isSameMethod |
	isSameMethod := [ :aMethod |
	                aMethod name = fastMethod name sourceCode and: [
		                aMethod hasSourceAnchor 
			and: [
			                aMethod sourceText trimmed = fastMethod sourceCode trimmed ] ] ].

	"Check if the entity itself matches"
	famixEntity class = FamixTMethod ifTrue: [
		(isSameMethod value: famixEntity) ifTrue: [ ^ famixEntity ] ].

	"Otherwise, search among all methods in scope"
	^ (famixEntity allToScope: FamixTMethod)
		  detect: [ :method | isSameMethod value: method ]
		  ifNone: [ nil ]
]
