(deftemplate FZrange
200 800 pts
((high (200 0) (500 0.5) (800 1))))


(deftemplate student_record "The record"
(slot snum)
(slot sname)
(slot major)
(slot math1051)
(slot math1071)
(slot units) ; Number of other units passed
(slot satexamm (type FUZZY-VALUE FZrange))) ;SAT-Math Exam(200 to 800)

(deftemplate class_enrolled 
(slot snum)
(slot cno))

(deftemplate class_completed
(slot cno)
(slot cname) 
(slot dept))

(defrule Recommend_to_Take_Math
(Interest ?snum math)
(Ability ?snum math)
=>
(assert (Recommend ?snum take-math))
)

(defrule Interest-in-Math
(declare (CF 0.9))

(student_record (snum ?snumb))
(class_enrolled (snum ?snumb) (cno ?cnumb))
(class_completed (cno ?cnumb) (dept math))
=> 
(assert (Interest ?snumb math))
)

(defrule Ability-to-Take-Math
(student_record (snum ?snumb) (satexamm high))
=> 
(assert (Ability ?snumb math))
)


(deffacts initial-facts
(student_record (snum 0864114) (sname "Krunal Patel") 
(major "computer")
(math1051 "yes")
(math1071 "yes")
(units 5)
(satexamm (749 0) (750 1) (751 0)))
(class_enrolled (snum 0864114) (cno 002))
(class_completed (cno 002) (cname "Algebra") (dept math))
)
