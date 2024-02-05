# PS-2024-Data-Lake

## 📚 Projet Scolaire | Data Lake

Janvier 2024

Groupe : Juliette, Loris, Flavien

### 📌 Consignes du projet : 

Mettre en place un Data Lake pour stocker, traiter et analyser les données générées par les capteurs des véhicules connectés. Le Data Lake doit être capable d'ingérer en temps réel les flux de données provenant des capteurs, stocker ces données de manière distribuée, permettre l'analyse en temps réel des logs et inclure une tâche spécifique liée aux données IoT, telle que la prédiction de maintenance.

### 🐱 Notre projet :

Ingestion de données en temps réel :
Utilisation d'Apache Kafka pour la gestion des flux de données en temps réel provenant des capteurs des véhicules.

Stockage distribué :
Utilisation d'Apache Hadoop pour le stockage distribué des données, permettant une évolutivité horizontale et un accès facile aux données.

Analyse de données IoT :
Utilisation d'Apache Spark pour l'analyse des données IoT, y compris des tâches spécifiques telles que la prédiction de maintenance.

Gestion des métadonnées :
Utilisation d'Apache Hive pour la gestion des métadonnées afin de faciliter la recherche et la navigation dans le Data Lake.

Visualisation des données :
Utilisation d'un outil de visualisation tel que Apache Superset pour créer des tableaux de bord interactifs.


Commandes :

Zookeeper :
docker exec -it projet-zookeeper-1 bash
root@c9d28f3ac276:/opt/zookeeper-3.4.6# bin/zkCli.sh

Kafka :
docker exec -it projet-kafka-1 kafka-topics.sh --create --topic my-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1
docker exec -it projet-kafka-1 kafka-topics.sh --list --bootstrap-server localhost:9092
docker exec -it projet-kafka-1 kafka-topics.sh --describe --topic my-topic --bootstrap-server localhost:9092
docker exec -it projet-kafka-1 kafka-console-producer.sh --topic my-topic --bootstrap-server localhost:9092
docker exec -it projet-kafka-1 kafka-console-consumer.sh --topic my-topic --from-beginning --bootstrap-server localhost:9092

Superset :
docker-compose exec superset superset db upgrade
docker-compose exec superset superset fab create-admin
docker exec -it projet-superset-1
superset init

Hive :
$env:HIVE_VERSION = "3.1.3"
docker run -d -p 10000:10000 -p 10002:10002 --env SERVICE_NAME=hiveserver2 --name hive4 apache/hive:$env:HIVE_VERSION
docker exec -it hive4  beeline -u 'jdbc:hive2://hiveserver2:10000/'
docker exec -it --user=root hive4 bash -c "echo '$(docker inspect -f '{{.NetworkSettings.IPAddress}}' hive4) hiveserver2' >> /etc/hosts"
docker exec -it hive4  beeline -u 'jdbc:hive2://hiveserver2:10000/'
CREATE DATABASE IF NOT EXISTS vehicules;

si erreur à la création de la base :
SHOW DATABASES;
DESCRIBE DATABASE EXTENDED default;
CREATE DATABASE IF NOT EXISTS vehicules LOCATION '/opt/hive/data/warehouse';
CREATE TABLE IF NOT EXISTS vehicules.position_vehicule (
    identifiant_vehicule STRING,
    latitude DOUBLE,
    longitude DOUBLE,
    vitesse INT,
    consommation_carburant INT,
   timestamp BIGINT
);
en sachant qu'autour de timestamp il faut mettre ` de chaque côté
INSERT INTO TABLE vehicules.position_vehicule
VALUES
  ('f26d1fc8-cbd3-4a28-b00e-0b99f55ae3cc', -61.245256, -79.297859, 47, 9, 1703258675),
  ('7fd1ef15-6821-4e07-89fd-3a7725bbd820', 87.1872855, 111.469132, 36, 5, 1703258675),
  ('dce281ae-9455-4597-a23b-c484f6db3e48', -27.155857, -176.110152, 6, 9, 1703258675);
SELECT * FROM vehicules.position_vehicule;

on peut y  accéder ici : http://localhost:10002/

Résumé :

Toutes les commandes écrites ci-dessus pour chaque service permettent de les faire fonctionner séparément.


### 💻 Applications et langages utilisés :

+ Visual Studio Code
+ Docker



## 🌸 Merci !
© J-IFT
