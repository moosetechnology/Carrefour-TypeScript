Class {
	#name : 'CRFTSModel',
	#superclass : 'MooseModel',
	#traits : 'FASTTEntityCreator + FamixTypeScriptTEntityCreator',
	#classTraits : 'FASTTEntityCreator classTrait + FamixTypeScriptTEntityCreator classTrait',
	#category : 'Carrefour-TypeScript-Model-Model',
	#package : 'Carrefour-TypeScript-Model',
	#tag : 'Model'
}

{ #category : 'accessing' }
CRFTSModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-TypeScript-Entities' #'Famix-Traits' #'FAST-TypeScript-Model' #'FAST-Core-Model')
]

{ #category : 'meta' }
CRFTSModel class >> annotation [
	<FMClass: #CRFTSModel super: #MooseModel>
	<package: #'Carrefour-TypeScript-Model'>
	<generated>
]
