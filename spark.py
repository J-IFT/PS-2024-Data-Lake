from pyspark.sql import SparkSession
from pyspark.sql.functions import col

# Initialiser une session Spark
spark = SparkSession.builder.appName("Vehicules").getOrCreate()

# Charger les données à partir du fichier CSV
data = spark.read.csv("donnees_vehicules.csv", header=True, inferSchema=True)

# Filtrer les données pour les véhicules avec une vitesse supérieure à 80
donnees_filtrees = data.filter(col('vitesse') > 80)

# Afficher les résultats
donnees_filtrees.show()