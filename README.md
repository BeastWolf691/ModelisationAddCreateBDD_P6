## Modélisation et création de BDD  

## 📝 Description du projet  

L'objectif principal est de concevoir une base de données relationnelle permettant de gérer le suivi des problèmes rencontrés sur les différents produits logiciels de l'entreprise **NexaWorks**.  
Chaque produit dispose de plusieurs versions compatibles avec divers systèmes d'exploitation.  
La base permet de suivre les problèmes identifiés, leur résolution, ainsi que les informations associées.


## 📁 Contenu du dépôt  

- **Modèle Conceptuel de Données (MCD)** : Un diagramme décrivant les relations entre les entités.
- **Dossier SQL** : Scripts permettant la création de la base de données et l’injection des données.
- **Dossier LINQ** :
  - Une méthode générale pour récupérer un ticket unique (dump simple).
  - Deux fichiers de requêtes optimisées permettant l’export de **dumps multiples** :
    - Request_en_cours.linq : requête optimisée pour récupérer plusieurs tickets avec le statut "En cours".
    - Request_resolus.linq : requête optimisée pour récupérer plusieurs tickets avec le statut "Résolu"
- **Dump de la base** : Sauvegarde `.bak` de la base de données.


## Modèle Conceptuel de Données  

![image](https://github.com/user-attachments/assets/8d2c3730-c282-4683-8b37-b6acf79f8994)  

La conception du MCD a été réalisée via **Lucidchart**, un outil de modélisation visuelle.  
Le schéma a ensuite été transcrit manuellement en **script SQL** (création des tables et relations),  
puis exécuté dans **SQL Server Management Studio (SSMS)**.  
Cette approche assure une parfaite cohérence entre la modélisation théorique et sa mise en œuvre technique.


## Objectifs du projet  

1. Concevoir un Modèle Entité-Association répondant aux besoins de NexaWorks.  
2. Générer un script SQL permettant de créer la base de données.  
3. Insérer des données factices pour valider le fonctionnement.  
4. Documenter le projet de manière claire et compréhensible.  


## 🚀 Lancement du projet  

1. Clonez le dépôt :
    - git clone https://github.com/BeastWolf691/ModelisationAddCreateBDD_P6.git

2. Création de la base de données :  
  a. Ouvrir SQL Server Management Studio (SSMS)  
  b. Créer une nouvelle requête  
  c. Copier-coller le script CreateBDD.sql présent dans le projet, puis appuyer sur F5 pour l’exécuter  
  d. Répéter la même procédure avec le script AddData.sql pour injecter les données factices  


## Technologies utilisées  

<p align="left"> 
  <img src="https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white" alt="SQL Server" /> 
  <img src="https://img.shields.io/badge/LINQPad-006400?style=for-the-badge&logo=data&logoColor=white" alt="LINQPad" /> 
  <img src="https://img.shields.io/badge/Lucidchart-FF8000?style=for-the-badge&logo=lucidchart&logoColor=white" alt="Lucidchart" /> 
  <img src="https://img.shields.io/badge/Visual%20Studio-5C2D91?style=for-the-badge&logo=visualstudio&logoColor=white" alt="Visual Studio"/> </p> 
  
