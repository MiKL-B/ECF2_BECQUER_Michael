--Requête 2  On souhaite obtenir la liste des projets (libellé court) sur lesquels un collaborateur est intervenu.
--Préciser également sa fonction dans les projets.
select libelle_court, nom_fonction from projet 
inner join activite on projet.id_projet = activite.id_projet 
inner join intervient on activite.id_activite = intervient.id_activite 
inner join fonction on intervient.id_fonction = fonction.id_fonction;