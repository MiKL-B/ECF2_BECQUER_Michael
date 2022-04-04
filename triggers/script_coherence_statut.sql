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
--drop
drop function if exists coherence_statut() cascade;
drop trigger if exists coherence_statut on collaborateur cascade;
--create
CREATE OR REPLACE FUNCTION coherence_statut()
RETURNS TRIGGER AS 
$$
DECLARE
BEGIN
IF (select id_statut from collaborateur = 3) THEN
    UPDATE collaborateur 
    SET  = NEW.id_statut;
END IF;

RETURN NEW;
END;
$$
LANGUAGE plpgsql;
--trigger
CREATE TRIGGER coherence_statut AFTER UPDATE ON collaborateur
FOR EACH ROW EXECUTE PROCEDURE coherence_statut();