# Utiliser une image de base Python
FROM python:3.11-slim

# Créer un utilisateur non-root
RUN useradd -m appuser

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers nécessaires dans le conteneur
COPY requirements.txt requirements.txt
COPY Hello.py Hello.py
COPY HelloWorld.desktop HelloWorld.desktop

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Changer d'utilisateur
USER appuser

# Commande à exécuter
CMD ["python", "Hello.py"]
