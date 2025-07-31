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
