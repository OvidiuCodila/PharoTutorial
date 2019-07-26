Class {
	#name : #GtInfoElementSlide,
	#superclass : #GtSlide,
	#instVars : [
		'text',
		'element'
	],
	#category : #'Tutorial-PharoForBeginners'
}

{ #category : #'api - instantiation' }
GtInfoElementSlide >> create [
	| container |
	container := BlElement new
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent ];
		layout: (BlGridLayout new vertical);
		addChild: (BlTextElement new
				constraintsDo: [ :c |
					c linear horizontal alignCenter.
					c linear vertical alignCenter];
				padding: (BlInsets top: 60; bottom: 40);
				margin: (BlInsets top: 20; left: 10);
				text: text);
		addChild: (BlElement new
			constraintsDo: [:ct |
				ct linear horizontal alignCenter.
				ct linear vertical alignCenter ];
			layout: (BlGridLayout new vertical));
			addChild: ((element asElementDo: [:e | 
							BlElement new 
								look: BrShadowLook;
								background: Color white;
								margin: (BlInsets all: 20);
								addChild: e])
							size: 400@400).
	^ container asPannableElement
]

{ #category : #accessing }
GtInfoElementSlide >> element: anElement [
	element := anElement.
]

{ #category : #initialization }
GtInfoElementSlide >> initialize [
	super initialize.
	self text: ''.
	self element: nil.
]

{ #category : #accessing }
GtInfoElementSlide >> text: aText [
	|ceva|
	text := aText asRopedText fontSize: 30; glamorousRegularFont.
	ceva := BrTextParagraphLineSpacingAttribute new.
	ceva applyOn: text.
]

{ #category : #'as yet unclassified' }
GtInfoElementSlide >> textWithFormat: aText [
	text := aText.
]
