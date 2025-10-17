Extension { #name : 'FamixTMethod' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTMethod >> bindFastModel: fastModel usingBinder: binder [
	binder bindFastModel: fastModel fromFamixMethodEntity: self
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTMethod >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
