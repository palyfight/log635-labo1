(clear)

(deftemplate moyen-transport (slot Classe)(multislot vehicule))
(deftemplate type-blessure (multislot marque))
(deftemplate access-route (slot vehicule) (multislot chemin))
(deftemplate victime  (slot nom))
(deftemplate lieu-cadavre (slot lieu-cadavre))
(deftemplate route (slot name) (slot km))
(deftemplate vehicule-route-temps (slot vehicule) (slot route) (slot temps))
(deftemplate profession-suspect-vehicule-climat (slot vehicule) (slot profession))
(deftemplate travelling-routes (slot name) (slot starts) (slot destination))
(deftemplate niveau-habilete (multislot profession) (slot arme) (slot niveau))
(deftemplate probabilite-meurtrier (slot probabilite) (slot arme) (slot nom))
(deftemplate mental-level (slot name) (slot level))

;;;;;;;;;;;;;;
; Profession ;
;;;;;;;;;;;;;;

;Faire les relations entre les professions et leur revenu
(deffacts lien-revenu-profession
	(profession Stripper est dans la classe moyenne)
	(profession Flight attendant est dans la classe moyenne)
	(profession Bartender est dans la classe pauvre)
	(profession Pilot est dans la classe riche)
	(profession Librarian est dans la classe pauvre)
	(profession Homeless est dans la classe pauvre)
	(profession Clerk est dans la classe moyenne)
	(profession Businessman est dans la classe riche)
	(profession Chef est dans la classe riche)
	(profession Policier est dans la classe moyenne)
	(profession Lawyer est dans la classe riche)
	(profession Judge est dans la classe riche)
	(profession Jury est dans la classe moyenne)
	(profession Scientist est dans la classe riche)
	(profession Chemist est dans la classe riche)
)

;;;;;;;;;;;;;;;;;
;  Etat mental  ;
;;;;;;;;;;;;;;;;;
(deffacts etat-mental
	(Etat mental est bon la personne est au niveau 1 etre suspect)
	(Etat mental est moyen la personne est au niveau 3 etre suspect)
	(Etat mental est derange la personne est au niveau 7 etre suspect)
	(Etat mental est sequel la personne est au niveau 10 etre suspect)
)

;;;;;;;;;;;;;;;;;
; Etat du corps ;
;;;;;;;;;;;;;;;;;

;Faire la relation entre la couleur du corps et le temps depuis la mort
(deffacts lien-couleur-temps
	(Couleur pale la personne est mort depuis 1 heure)
	(Couleur bleu la personne est mort depuis 6 heure)
	(Couleur purple la personne est mort depuis 12 heure)
)

;Faire la relation entre la regitditer du corps et le temps depuis la mort
(deffacts lien-rigiditer-temps
	(Rigiditer mole la personne est mort depuis 1 heure)
	(Rigiditer moyenne la personne est mort depuis 2 heure)
	(Rigiditer maximale la personne est mort depuis 3 heure)
)

;;;;;;;;;;;;;;;;;;;;;;;;
; Faits pour les routes ;
;;;;;;;;;;;;;;;;;;;;;;;;


;Faire la relation entre les route et les lieux
(deffacts lien-route-lieux
	(travelling-routes (name 13) (starts stripclub) (destination aeroport))
	(travelling-routes (name 720) (starts parc) (destination stripclub))
	(travelling-routes (name 66) (starts courthouse) (destination parc))
	(travelling-routes (name 15) (starts aeroport) (destination bar))
	(travelling-routes (name 90) (starts bar) (destination hotel))
	(travelling-routes (name 95) (starts hotel) (destination bibliotheque))
	(travelling-routes (name 110) (starts bibliotheque) (destination courthouse))
)

;Faire la relation entre les route et leur distance
(deffacts lien-route-distance
	;(route (name 24) (km 16))
	(route (name 13) (km 32))
	(route (name 720) (km 16))
	;(route (name 69) (km 8))
	(route (name 66) (km 48))
	;(route (name 40) (km 24))
	;(route (name 440) (km 20))
	(route (name 15) (km 16))
	;(route (name 20) (km 8))
	(route (name 90) (km 4))
	(route (name 95) (km 48))
	(route (name 110) (km 16))
)

;faire le lien entre le climat et la vitesse
(deffacts lien-climat-vitesse
	(Le climat rainy reduit la vitesse de 0.125)
	(Le climat sunny reduit la vitesse de 0)
	(Le climat cloudy reduit la vitesse de 0)
	(Le climat snowy reduit la vitesse de 0.25)
	(Le climat blizzard reduit la vitesse de 0.5)
	(Le climat thunderstorm reduit la vitesse de 0.375)
	(Le climat tsunami reduit la vitesse de 0.625)
)

;faire le lien entre le climat et les vehicules
(deffacts lien-climat-vehicule
	(Le climat rainy desactive-vehicule(list marche hoverboard))
	(Le climat snowy desactive-vehicule (list velo moto hoverboard)) 
	(Le climat blizzard desactive-vehicule (list avion bus voiture moto helicoptere velo marche hoverboard))
	(Le climat thunderstorm desactive-vehicule (list avion helicoptere))
	(Le climat tsuname desactive-vehicule (list avion bus voiture moto helicoptere velo marche hoverboard train))
)

;;;;;;;;;
; Armes ;
;;;;;;;;;

;Faire la relations entre les type de blessure et les armes
(deffacts lien-arme-blessure
	(blessure coupure est fait par type-armes Scie)
	(blessure coupure est fait par type-armes Marteau)
	(blessure coupure est fait par type-armes Couteau)
	(blessure mutilation est fait par type-armes Scie)
	(blessure mutilation est fait par type-armes Couteau)
	(blessure perforation est fait par type-armes Pistolet)
	(blessure perforation est fait par type-armes Couteau)
	(blessure cicatrices est fait par type-armes Corde)
	(blessure asphyxie est fait par type-armes Corde)
	(blessure asphyxie est fait par type-armes Gaz)
	(blessure strangulation est fait par type-armes Corde)
	(blessure contusions est fait par type-armes Baton-de-baseball Marteau)
	(blessure fractures est fait par type-armes Baton-de-baseball )
	(blessure fractures est fait par type-armes Voiture )
	(blessure fractures est fait par type-armes Moto )
	(blessure fractures est fait par type-armes Marteau)
	(blessure decomposition est fait par type-armes Arsenic)
	(blessure ecchymoses est fait par type-armes Marteau)
	(blessure brulure est fait par type-armes Lance)
	(blessure brulure est fait par type-armes-flamme)
	(blessure brulure est fait par type-armes Hydrogene-Liquide)
)

;Faire la relation entre les armes et les lieux
(deffacts lien-arme-lieu
	(lieu hotel contient arme-lieu Poison) 
	(lieu hotel contient arme-lieu Gaz) 
	(lieu hotel contient arme-lieu Voiture) 
	(lieu hotel contient arme-lieu Moto) 
	(lieu hotel contient arme-lieu Lance-flamme) 
	(lieu hotel contient arme-lieu Hydrogene-Liquide) 
	(lieu hotel contient arme-lieu Corde) 
	(lieu hotel contient arme-lieu Couteau)
	(lieu bar contient arme-lieu Couteau) 
	(lieu bar contient arme-lieu Scie) 
	(lieu bar contient arme-lieu Lance-flamme) 
	(lieu bar contient arme-lieu Poison)
	(lieu aeroport contient arme-lieu Pistolet) 
	(lieu aeroport contient arme-lieu Voiture) 
	(lieu aeroport contient arme-lieu Moto) 
	(lieu aeroport contient arme-lieu Marteau) 
	(lieu aeroport contient arme-lieu Scie)
	(lieu bibliotheque contient arme-lieu Corde) 
	(lieu bibliotheque contient arme-lieu C4) 
	(lieu bibliotheque contient arme-lieu Arsenic) 
	(lieu bibliotheque contient arme-lieu Scie)
	(lieu stripclub contient arme-lieu Corde) 
	(lieu stripclub contient arme-lieu Baton-de-baseball) 
	(lieu stripclub contient arme-lieu Marteau) 
	(lieu stripclub contient arme-lieu Voiture) 
	(lieu stripclub contient arme-lieu Moto) 
	(lieu stripclub contient arme-lieu Pistolet)
	(lieu parc contient arme-lieu Baton-de-baseball) 
	(lieu parc contient arme-lieu Voiture) 
	(lieu parc contient arme-lieu Moto) 
	(lieu parc contient arme-lieu Corde)
	(lieu courthouse contient arme-lieu Marteau) 
	(lieu courthouse contient arme-lieu Corde) 
	(lieu courthouse contient arme-lieu Voiture) 
	(lieu courthouse contient arme-lieu Pistolet)
)

(deffacts risque-suspect 
	(Risque neutre est 50)
	(Risque faible est 10)
	(Risque eleve est 100)
)

(deffacts relation-suspect 
	(relation amicale a un risque faible)
	(relation neutre a un risque neutre)
	(relation hostile a un risque eleve)
)

(deffacts relation-habilite-probabilite-de-meurtre
	(niveau habilite faible a une probabilite 25 detre meurtrier)
	(niveau habilite moyen a une probabilite 50 detre meurtrier)
	(niveau habilite expert a une probabilite 75 detre meurtrier)	
)

(deffacts test
	(lelelel est mort)
	(le cadavre a des fractures)
	(le cadavre se trouve au lieu parc)
	(le cadavre a une couleur pale)
	(le cadavre a une rigidite mole)
	(le cadavre a une temperature 18)
	(le cadavre a une relation amicale avec lulu)
	(le climat de la scene est snowy)
	(la personne lulu est profession Clerk)
	(La personne Philippe est une personne bon)
	(La personne Philippe a deja commis un crime)
)

;;;;;;;;;;;;;
; Transport ;
;;;;;;;;;;;;;
(deffacts velocite-vehicule
	(le vehicule avion a une velocite maximale de 16)
	(le vehicule helicoptere a une velocite maximale de 16)
	(le vehicule bus a une velocite maximale de 12)
	(le vehicule voiture a une velocite maximale de 12)
	(le vehicule moto a une velocite maximale de 12)
	(le vehicule train a une velocite maximale de 12)
	(le vehicule velo a une velocite maximale de 8)
	(le vehicule marche a une velocite maximale de 4)
	(le vehicule hoverboard a une velocite maximale de 4)
)

(reset)

;;;;;;;;;;;;;
; Transport ;
;;;;;;;;;;;;;

;Faire les relations entre les transport et revenu
(assert(moyen-transport (Classe riche) (vehicule avion bus voiture moto helicoptere velo marche hoverboard train)))
(assert(moyen-transport (Classe moyennes) (vehicule bus voiture moto velo marche hoverboard train)))
(assert(moyen-transport (Classe pauvre) (vehicule velo marche)))

;Faire le lien entre les vehicule et les travelling-routes
(assert   (access-route (vehicule avion) (chemin 13 66 95)))
(assert   (access-route (vehicule helicoptere) (chemin 13 66 95)))
(assert   (access-route (vehicule bus) (chemin 720 66 95)))
(assert   (access-route (vehicule voiture) (chemin 13 720 66 15 90 95 110)))
(assert   (access-route (vehicule moto) (chemin 13 15 90 110)))
(assert   (access-route (vehicule train) (chemin 13 15 110 66 720)))
(assert   (access-route (vehicule velo) (chemin 13 720 66 15 90 95 110)))
(assert   (access-route (vehicule marche) (chemin 13 720 66 15 90 95 110)))
(assert   (access-route (vehicule hoverboard) (chemin 13 720 66 15 90 95 110)))

;;;;;;;;;;;;;;;;;;;
; Armes-Profession;
;;;;;;;;;;;;;;;;;;;

;Faire la relation entre les armes et les professions
(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Pistolet) (niveau faible)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Pistolet) (niveau moyen)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Pistolet) (niveau expert)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Couteau) (niveau moyen)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Couteau) (niveau faible)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Couteau) (niveau expert)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Gaz) (niveau expert)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Gaz) (niveau moyen)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Gaz) (niveau faible)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Corde) (niveau faible)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Corde) (niveau expert)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Corde) (niveau moyen)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Baton-de-baseball) (niveau moyen)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Baton-de-baseball) (niveau expert)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Baton-de-baseball) (niveau faible)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Voiture) (niveau expert)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Voiture) (niveau faible)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Voiture) (niveau moyen)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Moto) (niveau moyen)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Moto) (niveau faible)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Moto) (niveau expert)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Arsenic) (niveau moyen)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Arsenic) (niveau faible)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Arsenic) (niveau expert)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Marteau) (niveau expert)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Marteau) (niveau faible)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Marteau) (niveau moyen)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Lance-flamme) (niveau faible)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Lance-flamme) (niveau expert)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Lance-flamme) (niveau moyen)))

(assert( niveau-habilete (profession Stripper Librarian Businessman Lawyer Scientist) (arme Hydrogene-liquide) (niveau moyen)))
(assert( niveau-habilete (profession Bartender Homeless Chef Judge Chemist) (arme Hydrogene-liquide) (niveau expert)))
(assert( niveau-habilete (profession Pilot Clerk Policier Jury Flight-attendant) (arme Hydrogene-liquide) (niveau faible)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Query ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defquery search-by-route-name
	(declare (variables ?chemin))
	(route (name ?chemin) (km ?km))
)

(defquery search-by-vehicule-route-temps
	(declare (variables ?route))
	(vehicule-route-temps (vehicule ?vehicule) (route ?route) (temps ?temps))
)

(defquery search-by-name
	(declare (variables ?probabilite))
	(probabilite-meurtrier (probabilite ?probabilite) (arme ?arme) (nom ?nom))
)

(defquery search-by-mental-level
	(declare (variables ?level))
	(mental-level  (name ?name) (level ?level))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Regles simples	   ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;		  Criminel 		  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defrule is-a-criminel
	(declare (salience 5))
	(La personne ?nom a deja commis un crime)
	=>
	(printout t ?nom " a deja commis un crime il est donc un suspect" crlf)
	(assert (is-a-criminel ?nom))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Calculer temps de mort  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Trouver le nombre d'heure ecouler entre 
;le temps que le cadavre a ete trouver 
;et le deces en fonction de la couleur du cadavre
(defrule time-of-death-couleur
  (declare (salience 5))
  (le cadavre a une couleur ?color)
  (Couleur ?color la personne est mort depuis ?time heure)
  =>
  (printout t "Selon la couleur du cadavre, la personne est morte " ?time " heure avant la decouverte du cadavre" crlf)
  (assert (delta-time-color-death ?time))
)

;Trouver le nombre d'heure ecouler entre 
;le temps que le cadavre a ete trouver 
;et le deces en fonction de la rigidite du cadavre
(defrule time-of-death-rigidite
  (declare (salience 5))
  (le cadavre a une rigidite ?rigidite)
  (Rigiditer ?rigidite la personne est mort depuis ?time heure) 
  =>
  (printout t "Selon la rigidite du cadavre, la personne est morte " ?time " heure avant la decouverte du cadavre" crlf)
  (assert (delta-time-rigidite-death ?time))
)

;Trouver le nombre d'heure ecouler entre 
;le temps que le cadavre a ete trouver 
;et le deces en fonction de la temperature du cadavre
(defrule time-of-death-temperature
  (declare (salience 5))
  (le cadavre a une temperature ?temperature) 
  =>
  (bind ?time (round (* (- 36.9 ?temperature) 1.2))) 
  (printout t "Selon la temperature du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-temperature-death ?time))
)


;Determiner le VRAI temps de deces
(defrule time-of-death
  (declare (salience 3))
  (delta-time-color-death ?time-color)
  (delta-time-rigidite-death ?time-rigidite)
  (delta-time-temperature-death ?time-temperature)
  =>
  (bind ?min-time(max ?time-color ?time-rigidite ?time-temperature))
  (printout t "Apres investigation, la personne est morte il y a " ?min-time " heures" crlf)
  (assert (delta-timedeath ?min-time))
)

;Arme du crime
(defrule arme-du-crime
	(declare (salience 10))
	(le cadavre a des ?blessures)
	(blessure ?blessures est fait par type-armes ?armes)
	=>
	(printout t "arme du crime possible est " ?armes crlf)
	(assert (armes-possible ?armes))
)

;Lieux possible pour armes du crime
(defrule location-arme
	(declare (salience 9))
	(armes-possible ?armes)
	(lieu ?lieux contient arme-lieu ?armes)
	=>
	(printout t "Lieux ou le suspect a pu prendre l'arme " ?armes " " ?lieux crlf)
	(assert (lieu-arme-suspect ?lieux))
)

;Niveau de suspects (low, med, high)
(defrule niveau-suspect
	(declare (salience 3))
	(le cadavre a une relation ?relation avec ?suspect)
	(relation ?relation a un risque ?niveau)
	=>
	(printout t "Les suspect " ?suspect " a une probabilite " ?niveau " d'etre le meurtrier" crlf)
)

;Niveau d'etat mental (bon, moyen, derange, sequel)
(defrule etat-mental
	(declare (salience 10))
	(La personne ?nom est une personne ?etat)
	(Etat mental est ?etat la personne est au niveau ?niveau etre suspect)
	=>
	(printout t ?nom " est une personne " ?etat crlf)
	(assert (mental-level (name ?nom) (level ?niveau)))
)

; ------- Complex or not?
;Determiner la vitesse des vehicules qui ne sont pas disabled
(defrule vitesse-vehicule
	(declare (salience 50))
	(le climat de la scene est ?climat)
	(le vehicule ?vehicule a une velocite maximale de ?vitesse)
	(Le climat ?climat reduit la vitesse de ?facteur)
	(Le climat ?climat desactive-vehicule $?list-desactive-vehicule)
	(test (not (member$ ?vehicule $?list-desactive-vehicule)))
	=>
	(bind ?velocite (* ?facteur ?vitesse))
	(assert (velocite-vehicule-climat ?vehicule ?velocite))
	;(printout t "La vitesse du moyen de transport " ?vehicule " dans le climat " ?climat " est " ?velocite crlf)
)

; ------- Complex or not?
;Determiner le temps qu'un vehicule prend parcourir un chemin au complet
(defrule temps-parcourir-chemin
	(declare (salience 25))
	(velocite-vehicule-climat ?vehicule ?velocite)
	(access-route (vehicule ?vehicule) (chemin $?chemins))
	=>
	(foreach ?chemin ?chemins
		(bind ?query-chemin (run-query* search-by-route-name ?chemin))
		(?query-chemin next)
		(bind ?distance (?query-chemin getInt km))
		(bind ?temps-deplacement (round (/ ?distance ?velocite)))
		(assert (vehicule-route-temps (vehicule ?vehicule) (route ?chemin) (temps ?temps-deplacement)))
	)
)

; ------- Complex or not?
;Deteminer les professions qui ont access au vehicule (a partir de la liste filtrer dans velocite-vehicule)
(defrule profession-vehicule 
	(declare (salience 24))
	(profession ?profession est dans la classe ?classe)
	(moyen-transport (Classe ?classe) (vehicule $?vehicules))
	(velocite-vehicule-climat ?vehicule ?velocite)
	(test (member$ ?vehicule $?vehicules)) 
	=>
	(assert(profession-suspect-vehicule-climat (vehicule ?vehicule) (profession ?profession)))
)

;Probabilite d'etre le suspect en fonction du niveau d'expertise avec l'arme du crime
(defrule probabilite-suspect-expertise-arme
	(declare (salience 1))
	(armes-possible ?armes-crime)
	(la personne ?suspect est profession ?profession)
	(niveau-habilete (profession $?liste-profession) (arme ?armes-crime) (niveau ?niveau))
	(niveau habilite ?niveau a une probabilite ?probabilite detre meurtrier)
	(test (member$ ?profession $?liste-profession))
	=>
	(assert (probabilite-meurtrier (probabilite ?probabilite) (arme ?armes-crime) (nom ?suspect)))
	(printout t "Le niveau d'expertise de " ?suspect " avec l'arme " ?armes-crime " est de " ?probabilite crlf)
)

;Eliminer les lieux qui ne peuvent etre visiter

;Eliminer les chemins qui sont en construction (mettre le temps de travel a l'infini)

;Lieux possible  ou le suspect aurait pu s'enfuir dans un delai de temps <= temps de decouverte du cadavre - temps de deces

;Relations entre personnages

(run)