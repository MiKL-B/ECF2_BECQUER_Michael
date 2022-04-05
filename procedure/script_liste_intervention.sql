--Procédure 3
--On veut lister les interventions des collaborateurs sur un projet entre deux dates.
--La procédure renvoie pour chaque intervention :
-- - Le nom du collaborateur associé
-- - La fonction en clair du collaborateur
-- - Les dates début et fin d’intervention
-- - La tâche ou activité associée.
--drop
drop function if exists liste_intervention();
--create
CREATE OR REPLACE FUNCTION liste_intervention()
RETURNS TABLE(id_activite integer, nom_prenom varchar, nom_fonction varchar,
date_debut_intervention date, date_fin_intervention date)
AS
$$
BEGIN
RETURN QUERY 
select activite.id_activite,collaborateur.nom_prenom, fonction.nom_fonction,intervient.date_debut_intervention,intervient.date_fin_intervention from intervient 
inner join collaborateur on intervient.id_collaborateur = collaborateur.id_collaborateur
inner join fonction on intervient.id_fonction = fonction.id_fonction
inner join activite on intervient.id_activite = activite.id_activite;
END;
$$
LANGUAGE plpgsql;
--call function
select liste_intervention();