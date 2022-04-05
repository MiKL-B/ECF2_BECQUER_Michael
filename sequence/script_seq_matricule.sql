--drop
drop sequence if exists seq_matricule;
--create
CREATE SEQUENCE seq_matricule 
INCREMENT 1
MINVALUE 1
MAXVALUE 9999
START 1;

