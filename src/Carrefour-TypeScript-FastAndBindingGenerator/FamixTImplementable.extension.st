Extension { #name : 'FamixTImplementable' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTImplementable >> bindFastModel: fastModel usingBinder: binder [
	binder bindFastModel: fastModel fromFamixInteraceEntity: self 
	
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTImplementable >> generateFastAndBind [

	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		             metamodel: CRFTSModel metamodel;
		             yourself.
	self bindFastModel: fastModel usingBinder: CRFTSBinderVisitor new.
	^ fastModel
]

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTImplementable >> getFASTModel [

	^ FASTTypeScriptParser new parse: self sourceAnchor sourceText
]
