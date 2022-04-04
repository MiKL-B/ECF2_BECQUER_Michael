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
drop function if exists coherence_statut() cascade;
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