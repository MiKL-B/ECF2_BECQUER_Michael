--sequence
CREATE OR REPLACE FUNCTION f_year_id(y text = to_char(now(), 'YY'))
  RETURNS text AS
$func$
BEGIN

LOOP
   BEGIN
      RETURN y || to_char(nextval('year_'|| y ||'_seq'), 'FM00');

   EXCEPTION WHEN undefined_table THEN   -- error code 42P01
      EXECUTE 'CREATE SEQUENCE year_' || y || '_seq MINVALUE 0 START 1';
   END;
END LOOP;

END
$func$ LANGUAGE plpgsql VOLATILE;
SELECT f_year_id();