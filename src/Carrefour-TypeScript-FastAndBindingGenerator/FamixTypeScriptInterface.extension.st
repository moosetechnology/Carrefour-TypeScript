Extension { #name : 'FamixTypeScriptInterface' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptInterface >> bindFastModel: fastModel usingBinder: binder [

	binder bindFastModel: fastModel fromFamixInterfaceEntity: self
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptInterface >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptInterface >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
