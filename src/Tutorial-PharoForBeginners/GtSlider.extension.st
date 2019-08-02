Extension { #name : #GtSlider }

{ #category : #'*Tutorial-PharoForBeginners' }
GtSlider >> addNewSlide: aSlide [
	(slides ifNil: [ slides := OrderedCollection new ] ) add: aSlide.
]
