USE TicketsSupport;
GO

INSERT INTO Status (id, name) VALUES 
(1,'En cours'), 
(2,'Résolu');

INSERT INTO OperatingSystem (id, name_os) VALUES 
(1,'Linux'), 
(2,'MacOS'), 
(3,'Windows'), 
(4,'Android'), 
(5,'iOS'), 
(6,'Windows Mobile');

INSERT INTO Versions (id, number_version) VALUES 
(1,'1.0'), 
(2,'1.1'), 
(3,'1.2'), 
(4,'1.3'), 
(5,'2.0'), 
(6,'2.1');

INSERT INTO Products (id, name) VALUES 
(1,'Trader en Herbe'), 
(2,'Maître des Investissements'), 
(3,'Planificateur d''entrainement'), 
(4,'Planificateur d''Anxiété Sociale');

INSERT INTO ProductVersionsOS (id, product_id, version_id, operating_system_id) VALUES 
(1,1,1,1) , (2,1,1,3) , (3,1,2,1) , (4,1,2,2) , 
(5,1,2,3) , (6,1,3,1) , (7,1,3,2) , (8,1,3,3) , 
(9,1,3,4) , (10,1,3,5) , (11,1,3,6) , (12,1,4,2) , 
(13,1,4,3) , (14,1,4,4) , (15,1,4,5) , (16,2,1,2) , 
(17,2,1,5) , (18,2,5,2) , (19,2,5,4) , (20,2,5,5) ,
(21,2,6,2) , (22,2,6,3) , (23,2,6,4) , (24,2,6,5) ,
(25,3,1,1) , (26,3,1,2) , (27,3,2,1) , (28,3,2,2) ,
(29,3,2,3) , (30,3,2,4) , (31,3,2,5) , (32,3,2,6) ,
(33,3,5,2) , (34,3,5,3) , (35,3,5,4) , (36,3,5,5) ,
(37,4,1,2) , (38,4,1,3) , (39,4,1,4) , (40,4,2,5) ,
(41,4,2,2) , (42,4,2,3) , (43,4,2,4) , (44,4,2,5);

INSERT INTO Tickets (id, date_create, date_end, status_id, productVersionsOS_id, problem, resolution) VALUES
(1, '2023-02-05', '2023-02-10', 2, 22, 'L’application plante lors de la génération d’un graphique de performance mensuelle sur certains comptes à fort historique.','Une erreur de mémoire a été identifiée. Ajout d’un système de pagination pour le rendu des données dans les graphiques.'),
(2, '2023-07-11', NULL, 1, 33,'Sur certains appareils Mobile, les rappels de séance d’entraînement ne s’activent pas lorsque l’application est en arrière-plan.',NULL),
(3, '2023-12-03', '2023-12-15', 2, 42,'Le programme ignore les préférences de notification définies par l’utilisateur à chaque redémarrage.','La sauvegarde locale des préférences était mal reliée à l’ID de session. Correction du chemin d’accès au fichier config.'),
(4, '2024-01-17', NULL, 1, 1,'Le bouton « Historique » ne répond pas lorsqu’on le sélectionne depuis le tableau de bord principal. Aucun retour visuel ni accès à la section.',NULL),
(5, '2024-05-09', '2024-05-20', 2, 36,'Le guidage vocal s’arrête soudainement à la 2e étape d’un programme personnalisé.','Problème identifié dans la gestion du buffer audio sur iOS. Patch appliqué dans la mise à jour 2.0.1.'),
(6, '2023-03-22', '2023-04-02', 2, 38,'Lors de la création d’un plan de gestion de stress, certaines réponses utilisateur disparaissent après validation du formulaire.','Correction d’une erreur dans la logique de validation de formulaire côté client. Le système supprimait les champs vides sans vérifier leur condition de dépendance.'),
(7, '2024-05-04', NULL, 1, 18,'Certains utilisateurs rapportent que l’export des rapports trimestriels reste bloqué à 0 % de progression et n’aboutit jamais.',NULL),
(8, '2023-08-09', '2023-08-15', 2, 7,'Le taux de change affiché dans les graphiques de performance est erroné pour l’EUR/USD et reste figé à 1.00.','Une API externe de conversion n’était plus à jour. Remplacement de la source par une API fonctionnelle avec vérification hebdomadaire automatisée.'),
(9, '2023-11-12', '2023-11-25', 2, 25,'L’historique d’entraînement s’affiche avec deux jours de décalage par rapport à la date réelle des séances.','Le fuseau horaire du serveur principal était mal synchronisé avec celui de l’utilisateur. Ajout d’une conversion automatique basée sur l’heure locale.'),
(10, '2024-06-01', NULL, 1, 16,'Le formulaire de contact du support client ne se charge pas dans l’onglet « Aide », ce qui empêche les utilisateurs de signaler les bugs directement.',NULL),
(11, '2024-04-18', '2024-04-30', 2, 44,'La fonctionnalité de respiration guidée se ferme automatiquement après 15 secondes sans retour utilisateur.','Un timeout de sécurité prévu pour l’arrêt automatique s’activait trop tôt. Correction du délai à 2 minutes avec option de prolongation.'),
(12, '2023-03-28', NULL, 1, 5,'Après une mise à jour récente, l’interface utilisateur charge indéfiniment les données de portefeuille sans jamais les afficher.',NULL),
(13, '2024-05-15', '2024-05-28', 2, 34,'Après avoir validé un objectif hebdomadaire, les séances générées incluent parfois des jours déjà passés dans la semaine.','Le calcul de la semaine courante utilisait une date fixe au lieu de la date système. Correction par un recalcul dynamique basé sur Date.now().'),
(14, '2024-04-03', NULL, 1, 13,'L’ajout d’un nouveau portefeuille plante l’application sur certaines configurations avec antivirus actif.',NULL),
(15, '2023-02-09', '2023-02-19', 2, 39,'Certains utilisateurs signalent un écran noir après la sélection du module « Apprivoiser une situation sociale ».','Problème lié au chargement asynchrone d\’un fichier audio. Refonte du module pour charger les ressources avant l''affichage.'),
(16, '2024-01-30', NULL, 1, 24,'Le graphique interactif ne répond plus au zoom par pincement sur iPhone 14.',NULL),
(17, '2023-07-20', '2023-07-25', 2, 30,'Les notifications de rappel des entraînements ne s\’affichent pas si l\’utilisateur a modifié l\’heure par défaut dans les paramètres.','Le système ne mettait pas à jour les permissions de notification après un changement d\’horaire. Patch déployé avec demande de ré autorisation.'),
(18, '2024-03-10', NULL, 1, 9,'Lors de la saisie d’un ordre d’achat avec un montant décimal (ex. 10,5), l’application refuse la validation et affiche une erreur de format.',NULL),
(19, '2023-09-18', '2023-10-02', 2, 19,'Le tableau des dividendes affiche des valeurs arrondies à zéro lorsque la devise est en yen japonais.','Changement du format d’affichage en supprimant l’arrondi forcé pour les faibles montants. Mise en place d’un format localisé.'),
(20, '2024-06-07', NULL, 1, 41,'Le bouton « démarrer un nouveau plan » reste grisé et inactif sur certaines installations MacOS.',NULL),
(21, '2024-01-08', '2024-02-10', 2, 23,'Lorsqu’un portefeuille dépasse les 200 titres, le tableau de répartition ne s’affiche plus dans le tableau de bord.','Bug lié à une limite imposée dans une ancienne fonction de pagination. Augmentation de la limite et ajout d’un système de chargement progressif.'),
(22, '2023-12-02', NULL, 1, 37,'Les exercices de respiration ne s’enregistrent pas automatiquement à l’heure programmée.',NULL),
(23, '2024-04-14', '2024-04-19', 2, 31,'L''utilisateur ne peut pas modifier un entraînement enregistré dans le passé.','Le champ de date était bloqué par défaut à la date actuelle. Correction de la logique pour permettre l’édition rétroactive.'),
(24, '2024-05-07', NULL, 1, 14,'Les notifications d’alerte ne se déclenchent pas quand une action atteint le seuil défini par l’utilisateur.',NULL),
(25, '2024-03-12', '2024-03-15', 2, 20,'Impossible d’ajouter une note personnalisée à une ligne du portefeuille. L’icône de modification reste inactive.','Bug JavaScript identifié et corrigé dans le module de saisie libre. Tests ajoutés pour éviter régression.');
