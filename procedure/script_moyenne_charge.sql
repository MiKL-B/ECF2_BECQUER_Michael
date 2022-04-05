--Procédure1
--On souhaite obtenir la moyenne des charges estimées sur les projets en cours.
--drop
drop function if exists moyenne_charge();
--create
CREATE OR REPLACE function moyenne_charge()
RETURNS TABLE (charge_estimee_globale numeric)
AS
$$
BEGIN
RETURN QUERY select AVG(projet.charge_estimee_globale) from projet where projet.date_reelle_fin IS NULL;
END;
$$
LANGUAGE plpgsql;
--call function
select moyenne_charge();