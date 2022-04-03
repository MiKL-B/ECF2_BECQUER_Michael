-- script contenant les requêtes demandées
--
--[REQUETES]
--TODO
--Requête 1 On souhaite obtenir par secteur d’activité la moyenne des charges estimées des projets.
--
 select libelle_court, nom_secteur_activite from projet inner join secteur_activite on projet.id_secteur_activite = secteur_activite.id_secteur_activite;
/* -------------------------------------------------------------------------- */
/*                                    GOOD                                    */
/* -------------------------------------------------------------------------- */
--Requête 2  On souhaite obtenir la liste des projets (libellé court) sur lesquels un collaborateur est intervenu.
--Préciser également sa fonction dans les projets.
select libelle_court, nom_fonction from projet 
inner join activite on projet.id_activite = activite.id_activite 
inner join intervient on activite.id_activite = intervient.id_activite 
inner join fonction on intervient.id_fonction = fonction.id_fonction;
--
--TODO a revoir  mcd resultat en double
--Requête 3 On souhaite obtenir à la date du jour la liste des projets en cours, par secteur d’activité.
--Préciser le nombre de collaborateurs associés aux projets et ceci par fonction.
SELECT current_date,libelle_court,nb_collab_max,nom_fonction,nom_secteur_activite from intervient
inner join fonction on intervient.id_fonction = fonction.id_fonction
inner join activite on intervient.id_activite = activite.id_activite
inner join projet on activite.id_activite = projet.id_activite
inner join secteur_activite on projet.id_secteur_activite = secteur_activite.id_secteur_activite
WHERE date_reelle_fin IS NULL;
--

--Requêtes de mise a jour
-- - Augmenter tous les salaires des collaborateurs de  5% si ils ont plus de 5 ans d’ancienneté.
UPDATE collaborateur SET remuneration = remuneration * 1.05 WHERE extract(year from current_date) -  extract(year from date_embauche) > 5;
-- - Supprimer de la base de données les projets qui sont terminés et qui n’ont pas eu de charges (étapes) associées.
DELETE FROM projet WHERE id_activite IS null AND date_reelle_fin IS NOT null;

--[TRIGGERS]
--
--Triggers de création
--
/* -------------------------------------------------------------------------- */
/*                                    GOOD                                    */
/* -------------------------------------------------------------------------- */
--table projet
--Vérifier que la date prévisionnelle de début du projet est inférieure ou égale la date prévisionnelle de fin du projet.
--
drop trigger if exists verif_date on projet cascade;
CREATE OR REPLACE FUNCTION verif_date() RETURNS trigger AS 
$$
    BEGIN
        -- Verifie que nom_employe et salary sont donnés
        IF NEW.date_prevue_debut >= NEW.date_prevue_fin THEN
            RAISE EXCEPTION 'ERROR la date de debut ne peut pas etre supérieur a la date de fin';
        END IF;
           RETURN NEW;
    END;
$$ 
LANGUAGE plpgsql;

CREATE TRIGGER verif_date BEFORE INSERT OR UPDATE ON projet
    FOR EACH ROW EXECUTE PROCEDURE verif_date();
--
/* -------------------------------------------------------------------------- */
/*                                    GOOD                                    */
/* -------------------------------------------------------------------------- */
--
--table client
--Vérifier la cohérence du chiffre d’affaire du client, si supérieur à 1 million d’euros par personne la valeur du CA est erronée.
--

drop trigger if exists verif_ca on client cascade;
CREATE OR REPLACE FUNCTION verif_ca() RETURNS trigger AS
$$
BEGIN
IF NEW.CA > 1000000 THEN
RAISE EXCEPTION 'ERROR la valeur du CA est erronée';
END IF;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER verif_ca BEFORE INSERT OR UPDATE ON client
FOR EACH ROW EXECUTE PROCEDURE verif_ca();
--
--TODO
--Triggers de mise a jour
--Table personnel
--Vérifier la cohérence du code statut,
--Passages possibles de :
-- - S (stagiaire) à D (CDD) ou I (CDI),
-- - D (CDD) à I (CDI).
--
-- 3 --> 2 --> ou 1
-- 2 --> 1

drop trigger if exists coherence_statut on collaborateur cascade;
CREATE OR REPLACE FUNCTION coherence_statut()
RETURNS TRIGGER AS 
$$
DECLARE
BEGIN
UPDATE collaborateur 
SET id_statut = NEW.id_statut WHERE id_statut = OLD.id_statut;
RETURN OLD;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER coherence_statut AFTER UPDATE ON collaborateur
FOR EACH ROW EXECUTE PROCEDURE coherence_statut();
--TODO
--Triggers de suppresion
--
--table projet
-- Ne pas supprimer un projet si la date réelle de fin du projet est inférieure à 2 mois par rapport à la date du jour.
-- IF NEW.date_reelle_fin > 2mois par rapport date du jour
-- delete
--current_date 
--current_timestamp pour date et heure

drop trigger if exists delete_projet on projet cascade;
CREATE OR REPLACE FUNCTION delete_projet()
RETURNS TRIGGER AS 
$$
BEGIN
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER delete_projet AFTER DELETE ON projet
FOR EACH ROW EXECUTE PROCEDURE delete_projet();

--
--[PROCEDURES]
--
--TODO
--Procédure1
--On souhaite obtenir la moyenne des charges estimées sur les projets en cours.
--
--Procédure 2
--On souhaite obtenir sur un thème technique donné la liste des projets associés et terminés depuis moins de 2 ans
SELECT libelle_court,date_reelle_fin from projet  where extract(year from current_date) - extract(year from date_reelle_fin) < 2 ;
--
--TODO a revoir  mcd resultat en double
--Procédure 3
--On veut lister les interventions des collaborateurs sur un projet entre deux dates.
--La procédure renvoie pour chaque intervention :
-- - Le nom du collaborateur associé
-- - La fonction en clair du collaborateur
-- - Les dates début et fin d’intervention
-- - La tâche ou activité associée.

select nom_prenom, nom_fonction, date_debut_intervention, date_fin_intervention, nom_activite from intervient
inner join collaborateur on intervient.id_collaborateur = collaborateur.id_collaborateur
inner join fonction on intervient.id_fonction = fonction.id_fonction
inner join activite on intervient.id_activite = activite.id_activite
inner join liste_activite on activite.id_liste_activite = activite.id_liste_activite;