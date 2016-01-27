(clear)

(deftemplate moyen-transport (multislot vehicule))
(deftemplate type-blessure (multislot marque))
(deftemplate access-route (multislot chemin))
(deftemplate direction-route (multislot chemin))
(deftemplate desactive-vehicule (multislot vehicule))
(deftemplate arme-lieu (multislot arme))
(deftemplate victime  (slot nom))
(deftemplate lieu-cadavre (slot lieu-cadavre))
(deftemplate type-armes (multislot armes))

##############
# Profession #
##############

#Faire les relations entre les professions et leur revenu
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

#############
# Transport #
#############

#Faire les relations entre les transport et revenu
(deffacts lien-transport-revenu
	(Classe riche possede moyen-transport (vehicule avion bus voiture moto helicoptere velo marcher hoverboard train))
	(Classe moyennes possede moyen-transport (vehicule bus voiture moto velo marcher hoverboard train))
	(Classe pauvre possede moyen-transport (vehicule velo marcher))
)

#########
# Armes #
#########

#Faire la relations entre les type de blessure et les armes
#(deffacts lien-arme-blessure
#	(Couteau fait des type-blessure (marque coupure mutilations perforations))
#	(Corde fait des type-blessure (marque cicatrices asphyxie strangulation))
#	(Pistolet fait des type-blessure (marque perforation))
#	(Baton-de-baseball fait des type-blessure (marque contusions fractures))
#	(Gaz fait des type-blessure (marque asphyxie))
#	(Voiture fait des type-blessure (marque fractures))
#	(Moto fait des type-blessure (marque fractures))
#	(Arsenic fait des type-blessure (marque decomposition))
#	(Marteau fait des type-blessure (marque contusions fractures ecchymoses coupures))
#	(Scie fait des type-blessure (marque coupure mutilations))
#	(Lance-flamme fait des type-blessure (marque brulure))
#	(Hydrogene-Liquide fait des type-blessure (marque brulure))
#)

#Faire la relations entre les type de blessure et les armes
(deffacts lien-arme-blessure
	(blessure coupure est fait par type-armes(armes Scie Marteau Couteau))
	(blessure mutilation est fait par type-armes(armes Scie Couteau))
	(blessure perforation est fait par type-armes(armes Pistolet Couteau))
	(blessure cicatrices est fait par type-armes(armes Corde))
	(blessure asphyxie est fait par type-armes(armes Corde Gaz))
	(blessure strangulation est fait par type-armes(armes Corde))
	(blessure contusions est fait par type-armes(armes Baton-de-baseball Marteau))
	(blessure fractures est fait par type-armes(armes Baton-de-baseball Voiture Moto Marteau))
	(blessure decomposition est fait par type-armes(armes Arsenic))
	(blessure ecchymoses est fait par type-armes(armes Marteau))
	(blessure brulure est fait par type-armes(armes Lance-flamme Hydrogene-Liquide))
)


#Faire la relation entre les armes et les lieux
(deffacts lien-arme-lieu
	(hotel contient arme-lieu(arme Poison Gaz Voiture Moto Lance-flamme Hydrogene-Liquide Corde Couteau))
	(bar contient arme-lieu(arme Couteau Scie Lance-flamme Poison))
	(aeroport contient arme-lieu(arme Pistolet Voiture Moto Marteau Scie))
	(bibliotheque contient arme-lieu(arme Corde C4 Arsenic Scie))
	(stripclub contient arme-lieu(arme Corde Baton-de-baseball Marteau Voiture Moto Pistolet))
	(parc contient arme-lieu(arme Baton-de-baseball Voiture Moto Corde))
	(courthouse contient arme-lieu(arme Marteau Corde Voiture Pistolet))
)

#################
# Etat du corps #
#################

#Faire la relation entre la couleur du corps et le temps depuis la mort
(deffacts lien-couleur-temps
	(Couleur pale la personne est mort depuis 1 heure)
	(Couleur bleu la personne est mort depuis 6 heure)
	(Couleur purple la personne est mort depuis 12 heure)
)

#Faire la relation entre la regitditer du corps et le temps depuis la mort
(deffacts lien-rigiditer-temps
	(Rigiditer mole la personnne est mort depuis 1 heure)
	(Rigiditer moyenne la personne est mort depuis 2 heure)
	(Rigiditer maximale la personne est mort depuis 3 heure)
)

########################
# Faits pour les routes #
########################

#Faire la relation entre les route et les lieux
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

#Faire la relation entre les route et leur distance
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

#Faire le lien entre les vehicule et les routes
(deffacts lien-vehicule-route
	(Le vehicule avion a access-route (chemin 13 66 95))
	(Le vehicule helicoptere a access-route (chemin 13 66 95))
	(le vehicule bus a access-route (chemin 24 720 66 440 20 95))
	(le vehicule voiture a access-route (chemin 24 13 720 69 66 40 440 15 20 90 95 110))
	(le vehicule moto a access-route (chemin 24 13 69 40 440 15 90 110))
	(le vehicule train a access-route (chemin 24 13 15 110 69 66 20 720 40))
	(le vehicule velo a access-route (chemin 24 13 720 69 66 40 440 15 20 90 95 110))
	(le vehicule marche a access route (chemin 24 13 720 69 66 40 440 15 20 90 95 110))
	(le vehicule hoverboard a access route (chemin 24 13 720 69 66 40 440 15 20 90 95 110))
)

#faire le lien entre la direction et les route
(deffacts lien-direction-route
	(Les chemin unidirectionnel sont direction-route(chemin 24 720 69 66 40 440 15 20 90 95 110))
	(Les chemin bidirectionnel sont direction-route(chemin 13))
)

#faire le lien entre le climat et les vehicules
(deffacts lien-climat-vehicule
	(Le climat rainy desactive-vehicule(vehicule marche hoverboard))
	(Le climat snowy desactive-vehicule(vehicule velo moto hoverboard))
	(Le climat blizzard desactive-vehicule(vehicule avion bus voiture moto helico velo marche hoverboard))
	(Le climat thunderstorm desactive-vehicule(vehicule avion helico))
	(Le climat tsunami desactive-vehicule(vehicule avion bus voiture moto helico velo marche hoverboard train))
)

#faire le lien entre le climat et la vitesse
(deffacts lien-climat-vitesse
	(Le climat rainy reduit la vitesse de 0.125)
	(Le climat sunny reduit la vitesse de 0)
	(Le climat cloudy reduit la vitesse de 0)
	(Le climat snowy reduit la vitesse de 0.25)
	(Le climat blizzard reduit la vitesse de 0.5)
	(Le climat thunderstorm reduit la vitesse de 0.375)
	(Le climat tsunami reduit la vitesse de 0.625)
)

########################################################
################# Regles simples	   #################
########################################################

#identifier la victime
(defrule identifer-victime
	(declare (salience 1))
  	(?personne est mort)
  	(assert (victime ?personne)) => (printout t "La victime est " ?personne)
)

#trouver lieu ou le cadavre est
(defrule identifier-lieu cadavre
  (declare (salience 1))
  (?personne est mort ?lieu)
  (victime ?personne) => (printout t "Le cadavre de " ?personne " a ete trouver au " ?lieu)
  (assert (lieu-cadavre ?lieu))
)

###########################
# Calculer temps de mort  #
###########################
#Trouver le nombre d'heure ecouler entre 
#le temps que le cadavre a ete trouver 
#et le deces en fonction de la couleur du cadavre
(defrule time-of-death-couleur
  (declare (salience 2))
  (le cadavre a une couleur ?color)
  (Couleur ?color la personne est mort depuis ?time heure)  =>  (printout t "Selon la couleur du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-color-death ?time))
)

#Trouver le nombre d'heure ecouler entre 
#le temps que le cadavre a ete trouver 
#et le deces en fonction de la rigidite du cadavre
(defrule time-of-death-rigidite
  (declare (salience 2))
  (le cadavre a une rigidite ?rigidite)
  (Rigiditer ?rigidite la personne est mort depuis ?time heure)  =>  (printout t "Selon la rigidite du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-rigidite-death ?time))
)

#Trouver le nombre d'heure ecouler entre 
#le temps que le cadavre a ete trouver 
#et le deces en fonction de la temperature du cadavre
(defrule time-of-death-temperature
  (declare (salience 2))
  (le cadavre a une temperature ?temperature)
  (bind ?time (* (- 36.9 ?temperature) 1.2)) 
  (printout t "Selon la temperature du cadavre, la personne est morte " ?time " avant la decouverte du cadavre" crlf)
  (assert (delta-time-temperature-death ?time))
)

#Determiner le VRAI temps de deces
(defrule time-of-death
  (declare (salience 3))
  (bind ?min-time(min delta-time-color-death delta-time-rigidite-death delta-time-temperature-death))
  (printout t "Apres investigation, la personne est morte il y a " ?min-time " heures" crlf)
  (assert (delta-timedeath ?min-time))
)

###########################
# Calculer temps de mort  #
###########################

#Trouver les armes du crime
(defrule identifier-armes-du-crime
	(declare (salience 4))
	(le cadave a des traces de ?blessure)
	(blessure ?blessure est fait par type-armes ?lists)
)