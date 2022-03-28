-- script contenant les requêtes demandées
--
--Requête 1 On souhaite obtenir par secteur d’activité la moyenne des charges estimées des projets.
--
--Requête 2  On souhaite obtenir la liste des projets (libellé court) sur lesquels un collaborateur est intervenu.
--Préciser également sa fonction dans les projets.
SELECT
  libCourt
from
  projet
  inner join collaborateur on projet.id_collab = collaborateur.id_collab
where
  id =;
--
  --Requête 3 On souhaite obtenir à la date du jour la liste des projets en cours, par secteur d’activité.
  --Préciser le nombre de collaborateurs associés aux projets et ceci par fonction.
  -- 2 triggers de création
  -- 1 trigger de mise a jour
  -- 1 trigger de suppression
  -- 3 procédures stockées