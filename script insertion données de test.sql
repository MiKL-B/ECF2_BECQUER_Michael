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
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut,id_fonction) VALUES('michel',2000,1,1,1,1);

--activite
INSERT INTO activite(date_debut_intervention,date_fin_intervention,type_intervention,id_liste_activite)
VALUES ('02/02/2012','04/04/2014','dépannage',1);
INSERT INTO activite(date_debut_intervention,date_fin_intervention,type_intervention,id_liste_activite)
VALUES ('10/03/2013','03/09/2016','autre',2);
--projet
INSERT INTO projet(libelle_court,id_activite,id_secteur_activite) VALUES ('premier',1,1);
INSERT INTO projet(libelle_court,id_activite,id_secteur_activite) VALUES ('deux',2,1);
INSERT INTO projet(libelle_court,id_activite,id_secteur_activite,date_prevue_debut,date_prevue_fin) 
VALUES ('test',1,1,'02/02/2020','03/03/2018');
--intervient
INSERT INTO intervient(id_collaborateur, id_fonction,id_activite) VALUES (1,2,1);
INSERT INTO intervient(id_collaborateur, id_fonction,id_activite) VALUES (1,3,1);
INSERT INTO intervient(id_collaborateur, id_fonction,id_activite) VALUES (1,4,1);
--client
INSERT INTO client(num_client,id_type_client,id_raison_sociale_client,id_domaine_activite,CA) 
VALUES ('test',1,1,1,1000);
INSERT INTO client(num_client,id_type_client,id_raison_sociale_client,id_domaine_activite,CA) 
VALUES ('test',1,1,1,1000000);
INSERT INTO client(num_client,id_type_client,id_raison_sociale_client,id_domaine_activite,CA) 
VALUES ('test',1,1,1,1000001);