Extension { #name : 'FamixTClass' }

{ #category : '*Carrefour-TypeScript-FastAndBindingGenerator' }
FamixTClass >> ensureCleanBinding [
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
	self fast ifNotEmpty: [ :decl | decl anyOne rootNode fullClean ].
]
