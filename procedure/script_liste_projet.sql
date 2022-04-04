--Procédure 2
--On souhaite obtenir sur un thème technique donné la liste des projets associés et terminés depuis moins de 2 ans
--drop
drop function if exists liste_projet();
--create
CREATE OR REPLACE function liste_projet()
RETURNS TABLE(libelle_court varchar, date_reelle_fin date)
AS
$$
BEGIN
RETURN QUERY SELECT projet.libelle_court, projet.date_reelle_fin from projet  where extract(year from current_date) - extract(year from projet.date_reelle_fin) < 2 ;
END;
$$
LANGUAGE plpgsql;


--call function 
select liste_projet();

