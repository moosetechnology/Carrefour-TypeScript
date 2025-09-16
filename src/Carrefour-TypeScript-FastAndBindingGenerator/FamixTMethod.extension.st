Extension { #name : 'FamixTMethod' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTMethod >> bindFastModel: fastModel usingBinder: binder [
	binder bindFastModel: fastModel fromFamixMethodEntity: self
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTMethod >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTMethod >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
