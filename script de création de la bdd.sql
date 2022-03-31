--script de création
--drop des tables 
drop table if exists intervient cascade;
drop table if exists contact_projet cascade;
drop table if exists a_des_infos cascade;
drop table if exists langage_developpement cascade;
drop table if exists information_technique cascade;
drop table if exists collaborateur cascade;
drop table if exists document_associe cascade;
drop table if exists retour_experience cascade;
drop table if exists client cascade;
drop table if exists projet cascade;
drop table if exists activite cascade;
drop table if exists raison_sociale_client cascade;
drop table if exists liste_activite cascade;
drop table if exists information_commerciale cascade;
drop table if exists etat_civil cascade;
drop table if exists sexe cascade;
drop table if exists statut cascade;
drop table if exists nature cascade;
drop table if exists domaine_activite cascade;
drop table if exists type_client cascade;
drop table if exists cycle_vie_projet cascade;
drop table if exists type_projet cascade;
drop table if exists secteur_activite cascade;
drop table if exists fonction cascade;
--create database
DROP DATABASE if exists abi;
CREATE DATABASE abi;
--create table
CREATE TABLE fonction(
   Id_fonction SERIAL,
   nom_fonction VARCHAR(15) ,
   PRIMARY KEY(Id_fonction)
);

CREATE TABLE secteur_activite(
   Id_secteur_activite SERIAL,
   nom_secteur_activite VARCHAR(25) ,
   PRIMARY KEY(Id_secteur_activite)
);

CREATE TABLE type_projet(
   Id_type_projet SERIAL,
   nom_type_projet VARCHAR(1) ,
   PRIMARY KEY(Id_type_projet)
);

CREATE TABLE cycle_vie_projet(
   Id_cycle_vie_projet SERIAL,
   nom_cycle_vie_projet VARCHAR(10) ,
   PRIMARY KEY(Id_cycle_vie_projet)
);

CREATE TABLE type_client(
   Id_type_client SERIAL,
   label_type_client VARCHAR(1) ,
   PRIMARY KEY(Id_type_client)
);

CREATE TABLE domaine_activite(
   Id_domaine_activite SERIAL,
   nom_domaine VARCHAR(100) ,
   PRIMARY KEY(Id_domaine_activite)
);

CREATE TABLE nature(
   Id_nature SERIAL,
   type_nature VARCHAR(50) ,
   PRIMARY KEY(Id_nature)
);

CREATE TABLE statut(
   Id_statut SERIAL,
   type_statut VARCHAR(3) ,
   PRIMARY KEY(Id_statut)
);

CREATE TABLE sexe(
   Id_sexe SERIAL,
   nom_sexe VARCHAR(1) ,
   PRIMARY KEY(Id_sexe)
);

CREATE TABLE etat_civil(
   Id_etat_civil SERIAL,
   type_etat_civil VARCHAR(3) ,
   PRIMARY KEY(Id_etat_civil)
);

CREATE TABLE information_commerciale(
   Id_information_commerciale SERIAL,
   commentaire VARCHAR(50) ,
   contact VARCHAR(50) ,
   PRIMARY KEY(Id_information_commerciale)
);

CREATE TABLE liste_activite(
   Id_liste_activite SERIAL,
   nom_activite VARCHAR(50) ,
   PRIMARY KEY(Id_liste_activite)
);

CREATE TABLE raison_sociale_client(
   Id_raison_sociale_client SERIAL,
   nom_raison_sociale VARCHAR(100) ,
   PRIMARY KEY(Id_raison_sociale_client)
);

CREATE TABLE activite(
   Id_activite SERIAL,
   charge_production INTEGER,
   charge_validation DATE,
   date_debut_intervention DATE,
   date_fin_intervention DATE,
   type_intervention VARCHAR(50) ,
   Id_liste_activite INTEGER,
   PRIMARY KEY(Id_activite),
   FOREIGN KEY(Id_liste_activite) REFERENCES liste_activite(Id_liste_activite)
);

CREATE TABLE projet(
   Id_projet SERIAL,
   code_projet VARCHAR(4) ,
   libelle_court VARCHAR(10) ,
   libelle_long VARCHAR(50) ,
   nb_collab_max INTEGER,
   charge_estimee_globale INTEGER,
   commentaire VARCHAR(100) ,
   date_prevue_debut DATE,
   date_prevue_fin DATE,
   date_reelle_debut DATE,
   date_reelle_fin DATE,
   Id_activite INTEGER,
   Id_cycle_vie_projet INTEGER,
   Id_type_projet INTEGER,
   Id_secteur_activite INTEGER,
   PRIMARY KEY(Id_projet),
   FOREIGN KEY(Id_activite) REFERENCES activite(Id_activite),
   FOREIGN KEY(Id_cycle_vie_projet) REFERENCES cycle_vie_projet(Id_cycle_vie_projet),
   FOREIGN KEY(Id_type_projet) REFERENCES type_projet(Id_type_projet),
   FOREIGN KEY(Id_secteur_activite) REFERENCES secteur_activite(Id_secteur_activite)
);

CREATE TABLE client(
   Id_client SERIAL,
   num_client VARCHAR(4) ,
   adresse_client VARCHAR(100) ,
   telephone VARCHAR(10) ,
   CA INTEGER,
   commentaire VARCHAR(100) ,
   Id_raison_sociale_client INTEGER NOT NULL,
   Id_nature INTEGER,
   Id_domaine_activite INTEGER NOT NULL,
   Id_type_client INTEGER NOT NULL,
   PRIMARY KEY(Id_client),
   FOREIGN KEY(Id_raison_sociale_client) REFERENCES raison_sociale_client(Id_raison_sociale_client),
   FOREIGN KEY(Id_nature) REFERENCES nature(Id_nature),
   FOREIGN KEY(Id_domaine_activite) REFERENCES domaine_activite(Id_domaine_activite),
   FOREIGN KEY(Id_type_client) REFERENCES type_client(Id_type_client)
);

CREATE TABLE retour_experience(
   Id_retour_experience SERIAL,
   nom_retour_experience VARCHAR(50) ,
   Id_projet INTEGER,
   PRIMARY KEY(Id_retour_experience),
   FOREIGN KEY(Id_projet) REFERENCES projet(Id_projet)
);

CREATE TABLE document_associe(
   Id_document_associe SERIAL,
   titre_doc VARCHAR(100) ,
   resume_doc VARCHAR(100) ,
   date_diffusion DATE,
   Id_projet INTEGER,
   PRIMARY KEY(Id_document_associe),
   FOREIGN KEY(Id_projet) REFERENCES projet(Id_projet)
);

CREATE TABLE collaborateur(
   Id_collaborateur SERIAL,
   matricule VARCHAR(4) ,
   nom_prenom VARCHAR(40) ,
   adresse1 VARCHAR(25) ,
   adresse2 VARCHAR(25) ,
   ville VARCHAR(40) ,
   codePostal VARCHAR(5) ,
   telephone VARCHAR(10) ,
   remuneration NUMERIC(15,2)  ,
   date_embauche DATE,
   date_fin_contrat DATE,
   Id_client INTEGER,
   Id_etat_civil INTEGER NOT NULL,
   Id_sexe INTEGER NOT NULL,
   Id_statut INTEGER NOT NULL,
   Id_fonction INTEGER NOT NULL,
   PRIMARY KEY(Id_collaborateur),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client),
   FOREIGN KEY(Id_etat_civil) REFERENCES etat_civil(Id_etat_civil),
   FOREIGN KEY(Id_sexe) REFERENCES sexe(Id_sexe),
   FOREIGN KEY(Id_statut) REFERENCES statut(Id_statut),
   FOREIGN KEY(Id_fonction) REFERENCES fonction(Id_fonction)
);

CREATE TABLE information_technique(
   Id_information_technique SERIAL,
   nom_info_technique VARCHAR(100) ,
   Id_projet INTEGER,
   Id_collaborateur INTEGER,
   PRIMARY KEY(Id_information_technique),
   FOREIGN KEY(Id_projet) REFERENCES projet(Id_projet),
   FOREIGN KEY(Id_collaborateur) REFERENCES collaborateur(Id_collaborateur)
);

CREATE TABLE langage_developpement(
   Id_langage_developpement SERIAL,
   nom_langage_dev VARCHAR(50) ,
   Id_information_technique INTEGER,
   PRIMARY KEY(Id_langage_developpement),
   FOREIGN KEY(Id_information_technique) REFERENCES information_technique(Id_information_technique)
);

CREATE TABLE a_des_infos(
   Id_projet INTEGER,
   Id_information_commerciale INTEGER,
   PRIMARY KEY(Id_projet, Id_information_commerciale),
   FOREIGN KEY(Id_projet) REFERENCES projet(Id_projet),
   FOREIGN KEY(Id_information_commerciale) REFERENCES information_commerciale(Id_information_commerciale)
);

CREATE TABLE contact_projet(
   Id_projet INTEGER,
   Id_client INTEGER,
   nom VARCHAR(50) ,
   fonction VARCHAR(50) ,
   durée VARCHAR(50) ,
   PRIMARY KEY(Id_projet, Id_client),
   FOREIGN KEY(Id_projet) REFERENCES projet(Id_projet),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client)
);

CREATE TABLE intervient(
   Id_collaborateur INTEGER,
   Id_fonction INTEGER,
   Id_activite INTEGER,
   PRIMARY KEY(Id_collaborateur, Id_fonction, Id_activite),
   FOREIGN KEY(Id_collaborateur) REFERENCES collaborateur(Id_collaborateur),
   FOREIGN KEY(Id_fonction) REFERENCES fonction(Id_fonction),
   FOREIGN KEY(Id_activite) REFERENCES activite(Id_activite)
);
