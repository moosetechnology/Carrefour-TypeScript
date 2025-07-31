Extension { #name : 'FamixTMethod' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTMethod >> generateFastAndBind [
	| fastModel | 
	self halt.
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFTSModel metamodel;
		yourself.
	"self bindFastModel: fastModel usingBinder: CRFBinderVisitor new."
	^ fastModel
]
