--table projet
-- Ne pas supprimer un projet si la date réelle de fin du projet est inférieure à 2 mois par rapport à la date du jour.
--drop
drop function if exists delete_projet() cascade;
drop trigger if exists delete_projet on projet cascade;
--create function
CREATE OR REPLACE FUNCTION delete_projet()
RETURNS TRIGGER AS 
$$
BEGIN
--IF OLD.date_reelle_fin::date - current_date::date < 2 THEN
IF extract(month from OLD.date_reelle_fin) - extract(month from current_date) > 2 THEN
RAISE EXCEPTION 'ERROR proj inf a 2 mois';
END IF;
return OLD;
END;
$$
LANGUAGE plpgsql;
--create trigger
CREATE TRIGGER delete_projet BEFORE DELETE ON projet
FOR EACH ROW EXECUTE PROCEDURE delete_projet();

 select extract(month from date_reelle_fin), extract(month from current_date) from projet;