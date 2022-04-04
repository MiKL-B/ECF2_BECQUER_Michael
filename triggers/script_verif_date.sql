--table projet
--Vérifier que la date prévisionnelle de début du projet est inférieure ou égale la date prévisionnelle de fin du projet.
--drop
drop function if exists verif_date() cascade;
drop trigger if exists verif_date on projet cascade;
--function
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
--trigger
CREATE TRIGGER verif_date BEFORE INSERT OR UPDATE ON projet
    FOR EACH ROW EXECUTE PROCEDURE verif_date();