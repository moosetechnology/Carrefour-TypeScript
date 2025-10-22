Extension { #name : 'FamixTypeScriptFunction' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptFunction >> bindFastModel: fastModel usingBinder: binder [

	binder bindFastModel: fastModel fromFamixFunctionEntity: self
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptFunction >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptFunction >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
