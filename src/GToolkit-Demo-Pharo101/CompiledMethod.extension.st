Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtNodesViewFor: aView [
	<gtView>
	| dict |
	dict := Dictionary new.
	self parseTree doSemanticAnalysis allChildren allButFirst do:
		[:aNode |
			(aNode isKindOf: RBSelfNode) ifTrue: [(dict at: 'SelfCalls'
				ifAbsentPut: OrderedCollection new) add: RBSelfNode].
			(aNode isKindOf: RBPragmaNode) ifTrue: [(dict at: 'Pragmas'
				ifAbsentPut: OrderedCollection new) add: RBPragmaNode].
			(aNode isKindOf: RBLiteralValueNode) ifTrue: [(dict at:
				'LiteralValues' ifAbsentPut: OrderedCollection new) add:
					RBLiteralValueNode].
			((aNode isKindOf: RBMessageNode) and: [aNode isUnary]) ifTrue:
				[(dict at: 'UnaryMessages' ifAbsentPut:
					OrderedCollection new) add: RBMessageNode].
			((aNode isKindOf: RBMessageNode) and: [aNode isBinary]) ifTrue:
				[(dict at: 'BinaryMessages' ifAbsentPut: 
					OrderedCollection new) add: RBMessageNode].
			((aNode isKindOf: RBMessageNode) and: [aNode isKeyword]) ifTrue:
				[(dict at: 'KeywordMessages' ifAbsentPut: 
					OrderedCollection new) add: RBMessageNode].
			(aNode isKindOf: RBBlockNode) ifTrue: [(dict at: 'Blocks'
				ifAbsentPut: OrderedCollection new) add: RBBlockNode].
			(aNode isKindOf: RBAssignmentNode) ifTrue: [(dict at:
				'Assignments' ifAbsentPut: OrderedCollection new)
					add: RBAssignmentNode].
			(aNode isKindOf: RBSuperNode) ifTrue: [(dict at: 'SuperCalls'
				ifAbsentPut: OrderedCollection new) add: RBSuperNode].
			(aNode isKindOf: RBLiteralArrayNode) ifTrue: [(dict at:
				'LiteralArrays' ifAbsentPut: OrderedCollection new)
					add: RBLiteralArrayNode].
			(aNode isKindOf: RBCascadeNode) ifTrue: [(dict at: 'Cascades'
				ifAbsentPut: OrderedCollection new) add: RBCascadeNode].
			(aNode isKindOf: RBReturnNode) ifTrue: [(dict at: 'Return'
				ifAbsentPut: OrderedCollection new) add: RBReturnNode].
			((aNode isKindOf: RBVariableNode) and: [ aNode isArg ]) ifTrue:
				[(dict at: 'ArgumentVariables' ifAbsentPut:
					OrderedCollection new) add: RBVariableNode ].
			((aNode isKindOf: RBVariableNode) and: [ aNode isGlobal ])
				ifTrue: [(dict at: 'GlobalVariables' ifAbsentPut: 
					OrderedCollection new) add: RBVariableNode ].
			(((aNode isKindOf: RBVariableNode) and: [ aNode isTemp ])
				and: [ aNode isArg not ]) ifTrue: [(dict at:
					'TemporaryVariables' ifAbsentPut: OrderedCollection new)
						add: RBVariableNode ].
	].
	
	^ aView columnedList
		title: 'Nodes';
		items: [dict associations];
		column: 'Category'
			item: [:each | each key];
		column: 'Elements'
			item: [:each | each value].
]

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtTreeCustomViewFor: aView [
	<gtView>
	^ aView tree
		title: 'TreeNodes';
		items: [ {self parseTree} ];
		children: #children.
]
