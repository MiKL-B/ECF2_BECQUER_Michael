
--TODO a revoir  mcd resultat en double
--Requête 3 On souhaite obtenir à la date du jour la liste des projets en cours, par secteur d’activité.
--Préciser le nombre de collaborateurs associés aux projets et ceci par fonction.

SELECT current_date,libelle_court,nb_collab_max,nom_fonction,nom_secteur_activite from intervient
inner join fonction on intervient.id_fonction = fonction.id_fonction
inner join activite on intervient.id_activite = activite.id_activite
inner join projet on activite.id_projet = projet.id_projet
inner join secteur_activite on projet.id_secteur_activite = secteur_activite.id_secteur_activite
WHERE date_reelle_fin IS NULL;
