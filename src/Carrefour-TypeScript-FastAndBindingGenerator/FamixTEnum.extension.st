Extension { #name : 'FamixTEnum' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTEnum >> ensureCleanBinding [
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
]
