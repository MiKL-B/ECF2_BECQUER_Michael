--TODO
--Triggers de suppresion
--
--table projet
-- Ne pas supprimer un projet si la date réelle de fin du projet est inférieure à 2 mois par rapport à la date du jour.
-- IF NEW.date_reelle_fin > 2mois par rapport date du jour
-- delete
--current_date 
--current_timestamp pour date et heure
drop function if exists delete_projet() cascade;
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

