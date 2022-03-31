--script insertion données de test
--etat civil
INSERT INTO etat_civil(type_etat_civil) VALUES ('MR');
INSERT INTO etat_civil(type_etat_civil) VALUES ('MME');
INSERT INTO etat_civil(type_etat_civil) VALUES ('MLE');
--sexe
INSERT INTO sexe(nom_sexe) VALUES ('F');
INSERT INTO sexe(nom_sexe) VALUES ('M');
--statut
INSERT INTO statut(type_statut) VALUES ('CDI');
INSERT INTO statut(type_statut) VALUES ('CDD');
INSERT INTO statut(type_statut) VALUES ('STA');
--fonction
INSERT INTO fonction(nom_fonction) VALUES ('chef projet');
INSERT INTO fonction(nom_fonction) VALUES ('analyste appli');
INSERT INTO fonction(nom_fonction) VALUES ('développeur');
INSERT INTO fonction(nom_fonction) VALUES ('tech support');
INSERT INTO fonction(nom_fonction) VALUES ('commercial');
INSERT INTO fonction(nom_fonction) VALUES ('tech-com');
INSERT INTO fonction(nom_fonction) VALUES ('secrétaire');
--nature
INSERT INTO nature(type_nature) VALUES ('principale');
INSERT INTO nature(type_nature) VALUES ('secondaire');
INSERT INTO nature(type_nature) VALUES ('ancienne');
--domaine_activite
INSERT INTO domaine_activite(nom_domaine) VALUES('agro-alimentaire');
INSERT INTO domaine_activite(nom_domaine) VALUES('transports');
INSERT INTO domaine_activite(nom_domaine) VALUES('télécommunication');
INSERT INTO domaine_activite(nom_domaine) VALUES('informatique');
INSERT INTO domaine_activite(nom_domaine) VALUES('distribution');
INSERT INTO domaine_activite(nom_domaine) VALUES('bâtiment');
INSERT INTO domaine_activite(nom_domaine) VALUES('chimie');
INSERT INTO domaine_activite(nom_domaine) VALUES('electronique');
INSERT INTO domaine_activite(nom_domaine) VALUES('energie');
--type_client
INSERT INTO type_client(label_type_client) VALUES('1');
INSERT INTO type_client(label_type_client) VALUES ('2');
--raison_sociale_client
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('nestlé');
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('auchan');
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('total');
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('orange');
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('mercedes');
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('edf');
--liste_activite
INSERT INTO liste_activite(nom_activite) VALUES ('analyse des besoins');
INSERT INTO liste_activite(nom_activite) VALUES ('conception');
INSERT INTO liste_activite(nom_activite) VALUES ('programmation');
INSERT INTO liste_activite(nom_activite) VALUES ('tests unitaires');
INSERT INTO liste_activite(nom_activite) VALUES ('tests recette et install');
INSERT INTO liste_activite(nom_activite) VALUES ('management projet');
INSERT INTO liste_activite(nom_activite) VALUES ('gestion config');
INSERT INTO liste_activite(nom_activite) VALUES ('formation spec projet');
INSERT INTO liste_activite(nom_activite) VALUES ('tests intégration');
INSERT INTO liste_activite(nom_activite) VALUES ('divers');
--langage_developpement
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('html');
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('css');
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('javascript');
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('php');
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('vue');
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('react');
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('angular');

--cycle_vie_projet
INSERT INTO cycle_vie_projet(nom_cycle_vie_projet) VALUES ('complet');
INSERT INTO cycle_vie_projet(nom_cycle_vie_projet) VALUES ('existant');
INSERT INTO cycle_vie_projet(nom_cycle_vie_projet) VALUES ('dév');
--type_projet
INSERT INTO type_projet(nom_type_projet) VALUES ('F');
INSERT INTO type_projet(nom_type_projet) VALUES ('R');
INSERT INTO type_projet(nom_type_projet) VALUES ('A');
--secteur_activite
INSERT INTO secteur_activite(nom_secteur_activite) VALUES ('gestion commercial');
INSERT INTO secteur_activite(nom_secteur_activite) VALUES ('RH');
INSERT INTO secteur_activite(nom_secteur_activite) VALUES ('production');
INSERT INTO secteur_activite(nom_secteur_activite) VALUES ('achat');

--collaborateur
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut) VALUES('michel',2000,1,1,1);
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut) VALUES('paul',1000,1,1,1);
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut) VALUES('jean',1200,1,1,1);
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut) VALUES('edouart',2400,1,1,1);
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut) VALUES('pierre',3000,1,1,1);
--a_une_fonction
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(1,1);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(1,2);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(1,3);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(2,1);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(2,2);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(3,3);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(4,3);
INSERT INTO a_une_fonction(id_collaborateur,id_fonction) VALUES(5,3);

--activite
INSERT INTO activite(date_debut_intervention,date_fin_intervention,type_intervention,id_liste_activite,id_collaborateur)
VALUES ('02/02/2012','04/04/2014','dépannage',1,1);
INSERT INTO activite(date_debut_intervention,date_fin_intervention,type_intervention,id_liste_activite,id_collaborateur)
VALUES ('10/03/2013','03/09/2016','autre',2,1);
--projet
INSERT INTO projet(libelle_court,id_activite,id_secteur_activite) VALUES ('premier',1,1);
INSERT INTO projet(libelle_court,id_activite,id_secteur_activite) VALUES ('deux',2,1);