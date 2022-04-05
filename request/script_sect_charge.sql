--Requête 1 On souhaite obtenir par secteur d’activité la moyenne des charges estimées des projets.

 select AVG(charge_estimee_globale) from projet  inner join secteur_activite on projet.id_secteur_activite = secteur_activite.id_secteur_activite ;