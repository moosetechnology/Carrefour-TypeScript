Extension { #name : 'FamixTEnum' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTEnum >> bindFastModel: fastModel usingBinder: binder [
	binder bindFastModel: fastModel fromFamixEnumEntity: self 
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTEnum >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
	

]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTEnum >> getFASTModel [
	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
