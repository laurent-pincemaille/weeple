

# Objectif
Créer une ludothèque de particuliers collaborative et organiser des évènements de rencontres de jeux

# Mise en place

## Run backend

### Installation nécessaires
* Installation de python 3
* Création d'un env virtuel depuis la racine du projet
```
python -m venv venv
```
* Installation des packages nécessaires:
```
python -r requirements.txt
```
* Mise à jour de VsCode (Optionnel)

```
Ctrl+Maj+P > Select interpreter > Choisir le script python.exe dans: venv/Scripts/python.exe (pour Windows) et venv/bin/python (pour Unix)
```

### Lancer le backend
* Activer l'environnement virtuel avec VScode (automatique) ou en ligne de commande:
```
venv\Scripts\activate (windows) ou venv/bin/activate (macos)
```

* Puis lancer le serveur back depuis la racine du projet
```
flask --app backend/app run 
```

## Run Frontend


