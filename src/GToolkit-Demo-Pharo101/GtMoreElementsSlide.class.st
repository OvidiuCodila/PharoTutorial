Class {
	#name : #GtMoreElementsSlide,
	#superclass : #GtSlide,
	#instVars : [
		'elements'
	],
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #'as yet unclassified' }
GtMoreElementsSlide >> create [
	| container |
	container := BlElement new
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent ];
		layout: (BlGridLayout new columnCount: 3).
	elements do: [:view | 
		container addChild: (( view
			asElementDo: [:e | 
				BlElement new 
					look: BrShadowLook; 
					background: Color white;
					margin: (BlInsets all: 20);
					addChild: e]) size: 400@400) ].
	^ container asPannableElement
]

{ #category : #accessing }
GtMoreElementsSlide >> elements: someElements [
	elements := someElements.
]

{ #category : #initialization }
GtMoreElementsSlide >> initialize [
	super initialize.
	self elements: nil.
]
