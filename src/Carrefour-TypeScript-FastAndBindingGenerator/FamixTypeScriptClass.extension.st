Extension { #name : 'FamixTypeScriptClass' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptClass >> bindFastModel: fastModel usingBinder: binder [

	binder bindFastModel: fastModel fromFamixClassEntity: self
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptClass >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTypeScriptClass >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText 
	
]
