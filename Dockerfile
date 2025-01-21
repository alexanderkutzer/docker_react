# 1. Stufe: App bauen
FROM node:lts-alpine AS builder

# Arbeitsverzeichnis erstellen
WORKDIR /app

# Abhängigkeiten installieren
COPY package.json package-lock.json ./
RUN npm install

# Quellcode kopieren und App bauen
COPY . .
RUN npm run build

# 2. Stufe: Mit Nginx bereitstellen
FROM nginx:stable-alpine

# Port für die App öffnen
EXPOSE 80

# Gebaute Dateien kopieren
COPY --from=builder /app/dist /usr/share/nginx/html

# Nginx starten
CMD ["nginx", "-g", "daemon off;"]

