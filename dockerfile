# Utilise une image de base Python légère
FROM python:3.11-slim

# Définit le répertoire de travail dans le conteneur
WORKDIR /app

# Copie le fichier de dépendances et les installe
# Note : Nous copions également le driver PostgreSQL nécessaire
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copie le reste du code de l'application (votre main.py ou le script principal)
# Le code du dépôt est dans 'src/bot.py'
COPY . /app

# Commande pour démarrer l'application (lance le script principal du bot)
# Basé sur la structure du dépôt d'origine
CMD ["python", "src/bot.py"]
