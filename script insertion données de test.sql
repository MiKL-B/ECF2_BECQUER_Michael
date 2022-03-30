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
--type_client
INSERT INTO type_client(label_type_client) VALUES('1');
INSERT INTO type_client(label_type_client) VALUES ('2');
--raison_sociale_client
INSERT INTO raison_sociale_client(nom_raison_sociale) VALUES('nestlé');
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
INSERT INTO langage_developpement(nom_langage_dev) VALUES ('javascript');
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