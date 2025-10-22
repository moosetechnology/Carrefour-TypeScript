Extension { #name : 'FamixTFunction' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTFunction >> ensureCleanBinding [
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
]
