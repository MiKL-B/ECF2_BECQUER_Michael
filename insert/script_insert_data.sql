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
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut,id_fonction,adresse1,ville,codePostal,telephone,date_embauche,date_fin_contrat) 
VALUES('michel',2000,1,1,1,1,'1 rue de pompey','pompey','54000','0102030405','02/03/2010','04/03/2019');
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut,id_fonction,adresse1,ville,codePostal,telephone,date_embauche) 
VALUES('paul',1000,1,1,2,2,'2 rue de frouard','frouard','54500','0607080901','01/02/2012');
--ne se fera pas augmenter son salaire car date_embauche < 5 ans par rapport a la date du jour
INSERT INTO collaborateur (nom_prenom,remuneration,id_etat_civil,id_sexe,id_statut,id_fonction,adresse1,ville,codePostal,telephone,date_embauche) 
VALUES('jean',1000,1,1,2,2,'2 rue de frouard','frouard','54500','0607080901','01/02/2022');

--projet
INSERT INTO projet(code_projet,libelle_court,id_secteur_activite,date_prevue_debut,date_prevue_fin,id_cycle_vie_projet,id_type_projet,nb_collab_max,date_reelle_debut)
VALUES ('5678','deux',1,'04/05/2016','04/04/2018',1,1,6,'01/04/2012');
INSERT INTO projet(libelle_court,id_secteur_activite,date_prevue_debut,date_prevue_fin,id_cycle_vie_projet,id_type_projet,nb_collab_max,date_reelle_debut,date_reelle_fin)
VALUES ('trois',1,'04/05/2016','04/04/2018',1,1,6,'01/04/2012','02/03/2013');
INSERT INTO projet(libelle_court,id_secteur_activite,date_prevue_debut,date_prevue_fin,id_cycle_vie_projet,id_type_projet,nb_collab_max,date_reelle_debut,date_reelle_fin)
VALUES ('quatre',1,'04/05/2016','04/04/2018',1,1,6,'01/04/2012','02/03/2021');
INSERT INTO projet(code_projet,libelle_court,id_secteur_activite,date_prevue_debut,date_prevue_fin,id_cycle_vie_projet,id_type_projet,nb_collab_max,date_reelle_debut)
VALUES ('5490','test',2,'02/02/2013','03/03/2018',1,1,5,'01/04/2010');
--renverra erreur car date prevue début > date prevue fin
INSERT INTO projet(code_projet,libelle_court,id_secteur_activite,date_prevue_debut,date_prevue_fin,id_cycle_vie_projet,id_type_projet,nb_collab_max,date_reelle_debut,date_reelle_fin)
VALUES ('1234','premier',1,'02/02/2019','03/03/2018',1,1,4,'01/04/2010','02/02/2021');

--activite
INSERT INTO activite(id_liste_activite,id_projet)
VALUES (1,2);
INSERT INTO activite(id_liste_activite,id_projet)
VALUES (2,2);
INSERT INTO activite(id_liste_activite,id_projet)
VALUES (4,6);
--intervient
INSERT INTO intervient(id_collaborateur, id_fonction,id_activite,date_debut_intervention,date_fin_intervention) VALUES (1,2,1,'02/02/2020','03/03/2022');
INSERT INTO intervient(id_collaborateur, id_fonction,id_activite,date_debut_intervention,date_fin_intervention) VALUES (1,2,2,'04/03/2018','04/05/2019');
INSERT INTO intervient(id_collaborateur, id_fonction,id_activite,date_debut_intervention,date_fin_intervention) VALUES (2,4,3,'04/03/2018','04/05/2019');
--client
INSERT INTO client(id_type_client,id_raison_sociale_client,id_domaine_activite,CA,id_projet,id_nature) 
VALUES (1,1,1,1000,2,1);
INSERT INTO client(id_type_client,id_raison_sociale_client,id_domaine_activite,CA,id_projet,id_nature) 
VALUES (1,1,1,1000000,2,1);
--renverra erreur car CA > 1 million
INSERT INTO client(id_type_client,id_raison_sociale_client,id_domaine_activite,CA,id_projet,id_nature) 
VALUES (1,1,1,1000001,2,1);