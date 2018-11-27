; >>Template Declaration<<
(deftemplate Animal (slot animal))
(deftemplate Legs (slot legs))
(deftemplate Wings (slot wings))
(deftemplate Skin (slot skin))
(deftemplate Habitat (slot habitat))
(deftemplate Color (slot color))



; >>Prediction function<<
(deffunction userInput (?ques ?options)
	(printout t ?ques " " ?options " ? ")
	(bind ?input (read))
	(if (lexemep ?input) then (bind ?input (lowcase ?input)))
	(while (not (member ?input ?options)) do
	    (printout t "please provide valid input" crlf ?ques " " ?options " ? ")
		(bind ?input (read))
	(if (lexemep ?input) then (bind ?input (lowcase ?input))))
		?input)
		
	
; >>Rule for prediction parameter<<		
(defrule queOne 
			(declare (salience 1000))
			=>
			(bind ?ans (userInput "How many legs does the animal have" (create$ 0 4)))
			(assert (Legs(legs ?ans))))
			
		
(defrule queTwo 
			(declare (salience 900))
			=>
			(bind ?ans (userInput "Does it have wings" (create$ yes no)))
			(assert (Wings(wings ?ans))))	


		
(defrule queThree 
			(declare (salience 800))
			
			=>
			(bind ?ans (userInput "What is it's skin type" (create$ fur skinny scales stripes spot)))
			(assert (Skin(skin ?ans))))	

		
(defrule queFour 
			(declare (salience 700))
			
			=>
			(bind ?ans (userInput "Where is it usually found" (create$ forest water desert domestic)))
			(assert (Habitat(habitat ?ans))))		

		
(defrule quesFive 
			(declare (salience 600))
			
			=>
			(bind ?ans (userInput "What is color of Animal?" (create$ silver grey dull-grey yellow darkyellow yellow-orange white-black brown yellow-black
						  dark-brown lightgrey)))
			(assert (Color(color ?ans))))				
			
; >>Rule for FISH<<

(defrule Fish
  (Legs (legs 0))
  (Wings (wings no))
  (Skin (skin scales))
  (Habitat (habitat water))
  (Color (color silver))
  =>
  (assert (Animal (animal Fish)))
 ) 
 
 (defrule animal-fish 
   (Animal(animal Fish))
=>
(printout t "Its a FISH!!" crlf)) 

; >>Rule for ELEPHANT<<

(defrule Elephant
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin skinny))
  (Habitat (habitat forest))
  (Color (color grey))
  =>
  (assert (Animal (animal Elephant)))
 ) 
 
 (defrule animal-elephant 
   (Animal(animal Elephant))
=>
(printout t "Its an ELEPHANT!!" crlf)) 



; >>Rule for GIRAFFE<<

(defrule Giraffe
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin spot))
  (Habitat (habitat forest))
  (Color (color yellow-orange))
  =>
  (assert (Animal (animal Giraffe)))
 ) 
 
 (defrule animal-giraffe 
   (Animal(animal Giraffe))
=>
(printout t "Its an GIRAFFE!!" crlf)) 

; >>Rule for BEAR<<

(defrule Bear
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin fur))
  (Habitat (habitat domestic))
  (Color (color dark-brown))
  =>
  (assert (Animal (animal Bear)))
 ) 
 
 (defrule animal-bear 
   (Animal(animal Bear))
=>
(printout t "Its a BEAR!!" crlf)) 

; >>Rule for RHINOCEROS<<

(defrule Rhino
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin skinny))
  (Habitat (habitat forest))
  (Color (color dull-grey))
  =>
  (assert (Animal (animal Rhino)))
 ) 
 
 (defrule animal-rhino 
   (Animal(animal Rhino))
=>
(printout t "Its a RHINOCEROS!!" crlf))

; >>Rule for KANGAROO<<

(defrule Kangaroo
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin skinny))
  (Habitat (habitat forest))
  (Color (color yellow))
  =>
  (assert (Animal (animal Kangaroo)))
 ) 
 
 (defrule animal-kangaroo 
   (Animal(animal Kangaroo))
=>
(printout t "Its a KANGAROO!!" crlf))
 


; >>Rule for LION<<

(defrule Lion
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin fur))
  (Habitat (habitat forest))
  (Color (color darkyellow))
  =>
  (assert (Animal (animal Lion)))
 ) 
 
 (defrule animal-lion 
   (Animal(animal Lion))
=>
(printout t "Its a LION!!" crlf)) 

; >>Rule for ZEBRA<<

(defrule Zebra
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin stripes))
  (Habitat (habitat domestic))
  (Color (color white-black))
  =>
  (assert (Animal (animal Zebra)))
 ) 
 
 (defrule animal-zebra 
   (Animal(animal Zebra))
=>
(printout t "Its a ZEBRA!!" crlf))

; >>Rule for TIGER<<

(defrule Tiger
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin stripes))
  (Habitat (habitat forest))
  (Color (color yellow-black))
  =>
  (assert (Animal (animal Tiger)))
 ) 
 
 (defrule animal-tiger 
   (Animal(animal Tiger))
=>
(printout t "Its a TIGER!!" crlf))

; >>Rule for FOX<<

(defrule Fox
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin fur))
  (Habitat (habitat domestic))
  (Color (color brown))
  =>
  (assert (Animal (animal Fox)))
 ) 
 
 (defrule animal-fox 
   (Animal(animal Fox))
=>
(printout t "Its a FOX!!" crlf))

;>>Rule for HIPPO<<

(defrule Hippo
  (Legs (legs 4))
  (Wings (wings no))
  (Skin (skin skinny))
  (Habitat (habitat water))
  (Color (color lightgrey))
  =>
  (assert (Animal (animal Hippo)))
 ) 
 
 (defrule animal-hippo 
   (Animal(animal Hippo))
=>
(printout t "Its a HIPPOPOTAMUS!!" crlf))
 
   