(clear)

(deftemplate moyen-transport (slot Classe)(multislot vehicule))
(deftemplate type-blessure (multislot marque))
(deftemplate access-route (slot vehicule) (multislot chemin))
(deftemplate victime  (slot nom))
(deftemplate lieu-cadavre (slot lieu-cadavre))

;;;;;;;;;;;;;;
; Profession ;
;;;;;;;;;;;;;;

;Faire les relations entre les professions et leur revenu
(deffacts lien-revenu-profession
	(Stripper est dans la classe moyenne)
	(Flight attendant est dans la classe moyenne)
	(Bartender est dans la classe pauvre)
	(Pilot est dans la classe riche)
	(Librarian est dans la classe pauvre)
	(Homeless est dans la classe pauvre)
	(Clerk est dans la classe moyenne)
	(Businessman est dans la classe riche)
	(Chef est dans la classe riche)
	(Policier est dans la classe moyenne)
	(Lawyer est dans la classe riche)
	(Judge est dans la classe riche)
	(Jury est dans la classe moyenne)
	(Scientist est dans la classe riche)
	(Chemist est dans la classe riche)
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
	(Rigiditer mole la personnne est mort depuis 1 heure)
	(Rigiditer moyenne la personne est mort depuis 2 heure)
	(Rigiditer maximale la personne est mort depuis 3 heure)
)

;;;;;;;;;;;;;;;;;;;;;;;;
; Faits pour les routes ;
;;;;;;;;;;;;;;;;;;;;;;;;

;faire le lien entre la direction et les route
(deffacts lien-direction-route
	(Les chemin unidirectionnel sont direction-route 24)
	(Les chemin unidirectionnel sont direction-route 720)
	(Les chemin unidirectionnel sont direction-route 69)
	(Les chemin unidirectionnel sont direction-route 66)
	(Les chemin unidirectionnel sont direction-route 40)
	(Les chemin unidirectionnel sont direction-route 440)
	(Les chemin unidirectionnel sont direction-route 15)
	(Les chemin unidirectionnel sont direction-route 20)
	(Les chemin unidirectionnel sont direction-route 90)
	(Les chemin unidirectionnel sont direction-route 95)
	(Les chemin unidirectionnel sont direction-route 110)
	(Les chemin bidirectionnel sont direction-route 13)
)

;Faire la relation entre les route et les lieux
(deffacts lien-route-lieux
	(La route 24 fait lien entre courthouse et stripclub)
	(La route 13 fait lien entre aeroport et stripclub)
	(La route 720 fait lien entre parc et stripclub)
	(La route 69 fait lien entre stripclub et bibliotheque)
	(La route 66 fait lien entre courthouse et parc)
	(La route 40 fait lien entre parc et hotel)
	(La route 440 fait lien entre bar et parc)
	(La route 15 fait lien entre aeroport et bar)
	(La route 20 fait lien entre hotel et aeroport)
	(La route 90 fait lien entre bar et hotel)
	(La route 95 fait lien entre hotel et bibliotheque)
	(La route 110 fait lien entre bibliotheque et courthouse)
)

;Faire la relation entre les route et leur distance
(deffacts lien-route-distance
	(La route 24 possede une distance de 16 km)
	(La route 13 possede une distance de 32 km)
	(La route 720 possede une distance de 16 km)
	(La route 69 possede une distance 8 km)
	(La route 66 possede une distance de 48 km)
	(La route 40 possede une distance de 24 km)
	(La route 440 possede une distance de 20 km)
	(La route 15 possede une distance de 16 km)
	(La route 20 possede une distance de 8 km)
	(La route 90 possede une distance de 4 km)
	(La route 95 possede une distance de 48 km)
	(La route 110 possede une distance de 16 km)
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
	(Le climat rainy desactive-vehicule marche)
	(Le climat rainy desactive-vehicule hoverboard)
	(Le climat snowy desactive-vehicule velo)
	(Le climat snowy desactive-vehicule moto)
	(Le climat snowy desactive-vehicule hoverboard)
	(Le climat blizzard desactive-vehicule avion)
	(Le climat blizzard desactive-vehicule bus)
	(Le climat blizzard desactive-vehicule voiture)
	(Le climat blizzard desactive-vehicule moto)
	(Le climat blizzard desactive-vehicule helico)
	(Le climat blizzard desactive-vehicule velo)
	(Le climat blizzard desactive-vehicule marche)
	(Le climat blizzard desactive-vehicule hoverboard)
	(Le climat thunderstorm desactive-vehicule avion)
	(Le climat thunderstorm desactive-vehicule helico)
	(Le climat tsuname desactive-vehicule avion) 
	(Le climat tsuname desactive-vehicule bus) 
	(Le climat tsuname desactive-vehicule voiture) 
	(Le climat tsuname desactive-vehicule moto) 
	(Le climat tsuname desactive-vehicule helico) 
	(Le climat tsuname desactive-vehicule velo) 
	(Le climat tsuname desactive-vehicule marche) 
	(Le climat tsuname desactive-vehicule hoverboard) 
	(Le climat tsuname desactive-vehicule train)
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
	(hotel contient arme-lieu Poison) 
	(hotel contient arme-lieu Gaz) 
	(hotel contient arme-lieu Voiture) 
	(hotel contient arme-lieu Moto) 
	(hotel contient arme-lieu Lance-flamme) 
	(hotel contient arme-lieu Hydrogene-Liquide) 
	(hotel contient arme-lieu Corde) 
	(hotel contient arme-lieu Couteau)
	(bar contient arme-lieu Couteau) 
	(bar contient arme-lieu Scie) 
	(bar contient arme-lieu Lance-flamme) 
	(bar contient arme-lieu Poison)
	(aeroport contient arme-lieu Pistolet) 
	(aeroport contient arme-lieu Voiture) 
	(aeroport contient arme-lieu Moto) 
	(aeroport contient arme-lieu Marteau) 
	(aeroport contient arme-lieu Scie)
	(bibliotheque contient arme-lieu Corde) 
	(bibliotheque contient arme-lieu C4) 
	(bibliotheque contient arme-lieu Arsenic) 
	(bibliotheque contient arme-lieu Scie)
	(stripclub contient arme-lieu Corde) 
	(stripclub contient arme-lieu Baton-de-baseball) 
	(stripclub contient arme-lieu Marteau) 
	(stripclub contient arme-lieu Voiture) 
	(stripclub contient arme-lieu Moto) 
	(stripclub contient arme-lieu Pistolet)
	(parc contient arme-lieu Baton-de-baseball) 
	(parc contient arme-lieu Voiture) 
	(parc contient arme-lieu Moto) 
	(parc contient arme-lieu Corde)
	(courthouse contient arme-lieu Marteau) 
	(courthouse contient arme-lieu Corde) 
	(courthouse contient arme-lieu Voiture) 
	(courthouse contient arme-lieu Pistolet)
)

(deffacts test
	(lelelel est mort)
)

(reset)

;;;;;;;;;;;;;
; Transport ;
;;;;;;;;;;;;;

;Faire les relations entre les transport et revenu
(assert(moyen-transport (Classe riche) (vehicule avion bus voiture moto helicoptere velo marcher hoverboard train)))
(assert(moyen-transport (Classe moyennes) (vehicule bus voiture moto velo marcher hoverboard train)))
(assert(moyen-transport (Classe pauvre) (vehicule velo marcher)))

;Faire le lien entre les vehicule et les routes

(assert   (access-route (vehicule avion) (chemin 13 66 95)))
(assert   (access-route (vehicule helicoptere) (chemin 13 66 95)))
(assert   (access-route (vehicule bus) (chemin 24 720 66 440 20 95)))
(assert   (access-route (vehicule voiture) (chemin 24 13 720 69 66 40 440 15 20 90 95 110)))
(assert   (access-route (vehicule moto) (chemin 24 13 69 40 440 15 90 110)))
(assert   (access-route (vehicule train) (chemin 24 13 15 110 69 66 20 720 40)))
(assert   (access-route (vehicule velo) (chemin 24 13 720 69 66 40 440 15 20 90 95 110)))
(assert   (access-route (vehicule marche) (chemin 24 13 720 69 66 40 440 15 20 90 95 110)))
(assert   (access-route (vehicule hoverboard) (chemin 24 13 720 69 66 40 440 15 20 90 95 110)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;; Regles simples	   ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Calculer temps de mort  ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Trouver le nombre d'heure ecouler entre 
;le temps que le cadavre a ete trouver 
;et le deces en fonction de la couleur du cadavre
(defrule time-of-death-couleur
  (declare (salience 2))
  (le cadavre a une couleur ?color)
  (Couleur ?color la personne est mort depuis ?time heure)  =>  (printout t "Selon la couleur du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-color-death ?time))
)

;Trouver le nombre d'heure ecouler entre 
;le temps que le cadavre a ete trouver 
;et le deces en fonction de la rigidite du cadavre
(defrule time-of-death-rigidite
  (declare (salience 2))
  (le cadavre a une rigidite ?rigidite)
  (Rigiditer ?rigidite la personne est mort depuis ?time heure)  =>  (printout t "Selon la rigidite du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-rigidite-death ?time))
)

;Trouver le nombre d'heure ecouler entre 
;le temps que le cadavre a ete trouver 
;et le deces en fonction de la temperature du cadavre
(defrule time-of-death-temperature
  (declare (salience 2))
  (le cadavre a une temperature ?temperature) 
  =>
  (bind ?time (* (- 36.9 ?temperature) 1.2)) 
  (printout t "Selon la temperature du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-temperature-death ?time))
)


;Determiner le VRAI temps de deces
(defrule time-of-death
  (declare (salience 3))
  =>
  (bind ?min-time(min delta-time-color-death delta-time-rigidite-death delta-time-temperature-death))
  (printout t "Apres investigation, la personne est morte il y a " ?min-time " heures" crlf)
  (assert (delta-timedeath ?min-time))
)
