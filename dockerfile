# Utilise une image de base Node.js LTS (Long Term Support)
FROM node:20-slim

# Définit le répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Copie le package.json et le package-lock.json pour installer les dépendances
# Ceci permet à Docker de mettre en cache les dépendances, accélérant les constructions
COPY package*.json ./

# Installe les dépendances
# Note : L'installation de discord.js doit se faire après le copy.
RUN npm install

# Copie le reste du code de l'application (l'index.js)
COPY . .

# Commande pour démarrer l'application (le bot)
# Le fichier principal est index.js selon le guide
CMD [ "node", "index.js" ]
