(deftemplate father-of (slot father) (slot child))
(deftemplate mother-of (slot mother) (slot child)) 
(deftemplate male (slot person)) 
(deftemplate female (slot person)) 
(deftemplate wife-of (slot wife) (slot husband)) 
(deftemplate husband-of (slot husband) (slot wife)) 
(deftemplate grandparent-of (slot grandparent)      (slot grandchild)) 
(deftemplate parent-of (slot parent) (slot child)) 
(deftemplate sibling-of (slot sibling1) (slot sibling2))
(deftemplate uncle-of (slot uncle) (slot person)) 
(deftemplate aunt-of (slot aunt) (slot person)) 
(deftemplate cousin-of (slot cousin1) (slot cousin2)) 
(deftemplate brother-of (slot brother) (slot sibling)) 
(deftemplate sister-of (slot sister) (slot sibling)) 
(deftemplate grandmother-of (slot grandmother) (slot grandchild)) 
(deftemplate grandfather-of (slot grandfather) (slot grandchild))
(deftemplate greatgrandparent-of (slot greatgrandparent) (slot greatgrandchild))
(deftemplate halfsibling-of (slot halfsibling1) (slot halfsibling2))

(deffacts my-family-tree
(parent-of (parent "Great-Grandparents") (child "Grandfather"))
(parent-of (parent "Great-Grandparents") (child "Greataunt"))
(parent-of (parent "Great-Grandparents") (child "Greatuncle")) 
(wife-of (wife "Grandmother") (husband "Grandfather"))
(father-of (father "Grandfather") (child "Mother"))
(father-of (father "Grandfather") (child "Aunt"))
(father-of (father "Grandfather") (child "Uncle"))
(mother-of (mother "Grandmother") (child "Mother"))
(mother-of (mother "Grandmother") (child "Aunt"))
(mother-of (mother "Grandmother") (child "Uncle"))
(wife-of (wife "Mother") (husband "Father"))
(wife-of (wife "Stepparent") (husband "Father"))
(mother-of (mother "Aunt") (child "1st Cousin1"))
(mother-of (mother "Aunt") (child "1st Cousin2"))
(mother-of (mother "Mother") (child "Joe"))
(mother-of (mother "Mother") (child "Sibling"))
(father-of (father "Father") (child "Joe"))
(father-of (father "Father") (child "Sibling"))
(father-of (father "Father") (child "Halfsibling"))
(mother-of (mother "Stepparent") (child "Halfsibling"))
(parent-of (parent "Sibling") (child "Niece"))
(parent-of (parent "Sibling") (child "Nephew"))
(parent-of (parent "Joe") (child "Child1"))
(parent-of (parent "Joe") (child "Child2"))
(parent-of (parent "Joe") (child "Child3"))
(male (person "Grandfather"))
(male (person "Greatuncle"))
(male (person "Uncle"))
(male (person "Father"))
(male (person "Joe"))
(male (person "Nephew"))
(female (person "Grandmother"))
(female (person "Greataunt"))
(female (person "Aunt"))
(female (person "Mother"))
(female (person "Niece"))
(female (person "Stepparent"))
)

(defrule is-parent-of
     (or(father-of (father ?p) (child ?c))        
	(mother-of (mother ?p) (child ?c)))      
=>     (assert (parent-of (parent ?p) (child ?c)))
)

(defrule is-sibling-of             
	(parent-of (parent ?p) (child ?c1))
	(parent-of (parent ?p) (child ?c2))
	(test (neq ?c1 ?c2))
=>     (assert (sibling-of (sibling1 ?c1) (sibling2 ?c2))) 
)

(defrule is-grandfather-of
	(parent-of (parent ?p) (child ?c1))     
	(parent-of (parent ?c1) (child ?c2))
	(male (person ?p))     
=>     (assert (grandfather-of (grandfather ?p) (grandchild ?c2))) ) 

(defrule is-grandmother-of
	(parent-of (parent ?p) (child ?c1))     
	(parent-of (parent ?c1) (child ?c2))
	(female (person ?p))     
=>     (assert (grandmother-of (grandmother ?p) (grandchild ?c2))) )

(defrule is-grandparent-of
	(or(grandfather-of (grandfather ?p) (grandchild ?c))        
	(grandmother-of (grandmother ?p) (grandchild ?c))     )      
=>     (assert (grandparent-of (grandparent ?p) (grandchild ?c))) )

(defrule is-greatgrandparent-of
	(parent-of (parent ?p) (child ?c1))     
	(grandparent-of (grandparent ?c1) (grandchild ?c2))    
=>     (assert (greatgrandparent-of (greatgrandparent ?p) (greatgrandchild ?c2))) )

(defrule is-aunt-of
	(parent-of (parent ?p) (child ?c1))     
	(sibling-of (sibling1 ?p) (sibling2 ?s2))
	(female (person ?s2))     
=>     (assert (aunt-of (aunt ?s2) (person ?c1))) )

(defrule is-uncle-of     
	(sibling-of (sibling1 ?p) (sibling2 ?s2))
	(parent-of (parent ?p) (child ?c1))
	(male (person ?s2))     
=>     (assert (uncle-of (uncle ?s2) (person ?c1))) )

(defrule is-cousin-of
     (or(uncle-of (uncle ?p) (person ?c))        
	(aunt-of (aunt ?p) (person ?c)))
	(parent-of (parent ?p) (child ?c1))
	(test (neq ?c1 ?c))      
=>     (assert (cousin-of (cousin1 ?c1) (cousin2 ?c))) ) 

(defrule is-halfsibling-of
     	(father-of (father ?f1) (child ?c1))
	(father-of (father ?f2) (child ?c2))
	(mother-of (mother ?m1) (child ?c1))
	(mother-of (mother ?m2) (child ?c2))
	(test (neq ?c1 ?c2)) 
	(test (neq ?m1 ?m2))   
	(test (eq ?f1 ?f2))  
=>     (assert (halfsibling-of (halfsibling1 ?c1) (halfsibling2 ?c2))) ) 




