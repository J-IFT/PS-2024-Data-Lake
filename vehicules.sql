-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS vehicules LOCATION '/opt/hive/data/warehouse';

-- Utiliser la base de données vehicules
USE vehicules;

-- Créer la table position_vehicule si elle n'existe pas
CREATE TABLE IF NOT EXISTS position_vehicule (
    identifiant_vehicule STRING,
    latitude DOUBLE,
    longitude DOUBLE,
    vitesse INT,
    consommation_carburant INT,
    timestamp BIGINT
);

-- Inserer des données dans la table position_vehicule
INSERT INTO position_vehicule VALUES
  ('f26d1fc8-cbd3-4a28-b00e-0b99f55ae3cc', -61.245256, -79.297859, 47, 9, 1703258675),
  ('7fd1ef15-6821-4e07-89fd-3a7725bbd820', 87.1872855, 111.469132, 36, 5, 1703258675),
  ('dce281ae-9455-4597-a23b-c484f6db3e48', -27.155857, -176.110152, 6, 9, 1703258675);

-- Sélectionner toutes les données de la table position_vehicule
SELECT * FROM position_vehicule;
