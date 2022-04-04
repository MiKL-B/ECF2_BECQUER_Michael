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
IF (OLD.id_statut = 1 AND NEW.id_statut = 2 OR OLD.id_statut = 2 AND NEW.id_statut = 3) THEN
  RAISE EXCEPTION 'ERROR on ne peut pas retrograder un collaborateur';
END IF;

RETURN NEW;
END;
$$
LANGUAGE plpgsql;
--trigger
CREATE TRIGGER coherence_statut AFTER UPDATE ON collaborateur
FOR EACH ROW EXECUTE PROCEDURE coherence_statut();
