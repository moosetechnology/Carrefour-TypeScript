Extension { #name : 'FamixTClass' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTClass >> bindFastModel: fastModel usingBinder: binder [
	binder bindFastModel: fastModel fromFamixClassEntity: self 
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTClass >> ensureCleanBinding [
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTClass >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTClass >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
