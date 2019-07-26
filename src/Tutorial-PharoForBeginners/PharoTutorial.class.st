Class {
	#name : #PharoTutorial,
	#superclass : #Object,
	#category : #'Tutorial-PharoForBeginners'
}

{ #category : #accessing }
PharoTutorial >> start [
	| slider |
	slider := GtSlider new
		slides: { 
			GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Tutorial for beginners' asRopedText fontSize: 50; foreground: Color gray). 
			GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Basic types' asRopedText fontSize:50; foreground: Color gray).
			GtTextSlide new
				subtitle: 'Numbers';
				firstText: '1, 2, 100, 2/3 ... are all Numbers';
				secondText: 'They all respond to many messages evaluating mathematical expressions'.
			GtInfoElementSlide new
				text: '20 factorial';
				element: ((20 factorial) gtIntegerFor: GtPhlowView empty).
			}.
		^ slider.
	
]
