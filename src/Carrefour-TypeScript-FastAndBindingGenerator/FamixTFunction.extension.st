Extension { #name : 'FamixTFunction' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTFunction >> bindFastModel: fastModel usingBinder: binder [
	binder bindFastModel: fastModel fromFamixFunctionEntity: self 
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTFunction >> generateFastAndBind [
	| fastModel | 
	self halt.
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFTSModel metamodel;
		yourself.
	 self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new. 
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTFunction >> getFASTModel [
	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
