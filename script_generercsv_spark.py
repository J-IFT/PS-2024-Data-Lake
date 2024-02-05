import csv
import time
import faker
import random

fake = faker.Faker()

def generer_donnees_vehicule():
    return {
        "identifiant_vehicule": fake.uuid4(),
        "latitude": fake.latitude(),
        "longitude": fake.longitude(),
        "vitesse": fake.random_int(min=0, max=120),
        "consommation_carburant": fake.random_int(min=5, max=20),
        "timestamp": int(time.time())
    }

def ecrire_dans_csv(chemin_fichier, donnees, entete=True):
    with open(chemin_fichier, 'w', newline='') as csvfile:
        noms_champs = donnees[0].keys()
        writer = csv.DictWriter(csvfile, fieldnames=noms_champs)

        if entete:
            writer.writeheader()

        for ligne in donnees:
            writer.writerow(ligne)

if __name__ == "__main__":
    nombre_enregistrements = 1000  # Modifiez ceci selon le nombre d'enregistrements souhaité
    liste_donnees = []

    for _ in range(nombre_enregistrements):
        liste_donnees.append(generer_donnees_vehicule())

    chemin_fichier_csv = "donnees_vehicules.csv"
    ecrire_dans_csv(chemin_fichier_csv, liste_donnees)

    print(f"Fichier CSV '{chemin_fichier_csv}' créé avec succès avec {nombre_enregistrements} enregistrements.")