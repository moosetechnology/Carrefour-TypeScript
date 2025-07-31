Class {
	#name : 'CRFTSBinderVisitor',
	#superclass : 'FASTCoreVisitor',
	#instVars : [
		'sourceFamixEntity'
	],
	#category : 'Carrefour-TypeScript-FastAndBindingGenerator',
	#package : 'Carrefour-TypeScript-FastAndBindingGenerator'
}

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> bindFastModel: fastModel fromFamixFunctionEntity: aFamixFunctionEntity [
	self
		execute: [ self sourceFamixEntity: aFamixFunctionEntity.
			fastModel allFASTTypeScriptFunctionDeclaration 
				"select: [ :functionDeclaration | functionDeclaration parentNode isNil ] 
				thenDo: [ :functionDeclaration | self halt . self accept: functionDeclaration ]."
				do: [ :functionDeclaration | self halt . self accept: functionDeclaration ].
				"(fastModel allWithType: FASTJavaInitializer) do: [ :functionDeclaration | self accept: functionDeclaration ]."
			fastModel metamodel: CRFTSModel metamodel ]
		recordedAs: 'Bind ' , aFamixFunctionEntity mooseName printString
]

{ #category : 'accessing' }
CRFTSBinderVisitor >> sourceFamixEntity [

	^ sourceFamixEntity
]

{ #category : 'accessing' }
CRFTSBinderVisitor >> sourceFamixEntity: anObject [

	sourceFamixEntity := anObject
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptFunctionDeclaration: aFASTTypeScriptFunctionDeclaration [

"	(aFASTTypeScriptFunctionDeclaration parentNode isNil and: [ aFASTTypeScriptFunctionDeclaration name = self sourceFamixEntity name ])
		ifTrue: [ ""The current node is the root of the analysis"" self sourceFamixEntity fast: aFASTTypeScriptFunctionDeclaration ]
		ifFalse: [ ""The method is declared inside the root, so we need to use the sourceAnchor to be sure of the binding""
			((self sourceFamixEntity allToScope: FamixTFunction)
				select: [ :method | 
					method name = aFASTTypeScriptFunctionDeclaration name
						and: [ method hasSourceAnchor
								and: [ | sourceStartPos |
									sourceStartPos := self sourceFamixEntityStartPo.
									method sourceAnchor startPos - sourceStartPos <= (aFASTTypeScriptFunctionDeclaration startPos + 1)
										and: [ method sourceAnchor endPos - sourceStartPos >= (aFASTTypeScriptFunctionDeclaration endPos - 1) ] ] ] ])
				ifNotEmpty: [ :methodsWithCorrectName | (self sortCollection: methodsWithCorrectName byDistanceWith: aFASTTypeScriptFunctionDeclaration) first fast: aFASTTypeScriptFunctionDeclaration ] ].
	aFASTTypeScriptFunctionDeclaration statements do: [ :statement | self accept: statement ].
	aFASTTypeScriptFunctionDeclaration parameters do: [ :parameter | self accept: parameter ].
	aFASTTypeScriptFunctionDeclaration typeParameters  do: [ :typeParameter | self accept: typeParameter ].	"
		
	self sourceFamixEntity fast: aFASTTypeScriptFunctionDeclaration.
]
