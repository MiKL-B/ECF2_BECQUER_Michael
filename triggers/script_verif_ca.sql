--table client
--Vérifier la cohérence du chiffre d’affaire du client, si supérieur à 1 million d’euros par personne la valeur du CA est erronée.
--drop
drop function if exists verif_ca() cascade;
drop trigger if exists verif_ca on client cascade;
--function
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
--trigger
CREATE TRIGGER verif_ca BEFORE INSERT OR UPDATE ON client
FOR EACH ROW EXECUTE PROCEDURE verif_ca();