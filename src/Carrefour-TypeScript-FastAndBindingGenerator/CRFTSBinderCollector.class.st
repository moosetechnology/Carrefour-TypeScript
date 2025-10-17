Class {
	#name : 'CRFTSBinderCollector',
	#superclass : 'FASTTypeScriptVisitor',
	#category : 'Carrefour-TypeScript-FastAndBindingGenerator',
	#package : 'Carrefour-TypeScript-FastAndBindingGenerator'
}

{ #category : 'detecting' }
CRFTSBinderCollector >> collectClass: fastClassName from: famixEntity [

	(famixEntity class = FamixTypeScriptClass and: [
		 famixEntity name = fastClassName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTClass)
		  detect: [ :class |
			   class name = fastClassName  ]
		  ifNone: [ nil ]
]

{ #category : 'detecting' }
CRFTSBinderCollector >> collectEnum: fastEnumName from: famixEntity [

	(famixEntity class = FamixTypeScriptEnum and: [
		 famixEntity name = fastEnumName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTEnum)
		  detect: [ :enum |
		   enum name = fastEnumName  ]
		  ifNone: [ nil ]
]

{ #category : 'detecting' }
CRFTSBinderCollector >> collectFunction: fastFunctionName from: famixEntity [

	(famixEntity class = FamixTypeScriptFunction and: [
		 famixEntity name = fastFunctionName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTFunction)
		  detect: [ :function |
			   function name = fastFunctionName  ]
		  ifNone: [ nil ]
]

{ #category : 'detecting' }
CRFTSBinderCollector >> collectInterface: fastInterfaceName from: famixEntity [

	(famixEntity class = FamixTypeScriptInterface and: [
		 famixEntity name = fastInterfaceName ]) ifTrue: [ ^ famixEntity ].

	^ (famixEntity allToScope: FamixTInheritance)
		  detect: [ :class |
			   class name = fastInterfaceName  ]
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
