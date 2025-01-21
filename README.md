# React App in einem Docker-Container

Dieses Projekt zeigt, wie eine React-App mit **Vite** in einem Docker-Container ausgeführt werden kann. Es enthält die notwendigen Dateien und Konfigurationen, um die App zu bauen, in einen Container zu packen und lokal oder in einer Produktionsumgebung auszuführen.

## Projektstruktur

```
.
├── Dockerfile
├── README.md
├── eslint.config.js
├── index.html
├── node_modules/
├── package-lock.json
├── package.json
├── public/
├── src/
├── vite.config.js
```

## Voraussetzungen

Bevor du beginnst, stelle sicher, dass folgende Tools installiert sind:

- **Docker**: [Download Docker](https://www.docker.com/get-started)
- **Node.js** (optional, nur für lokale Entwicklung): [Download Node.js](https://nodejs.org/)

---

## Schritte zum Starten der App

### 1. Projekt herunterladen

Clone das Repository:
```bash
git clone https://github.com/<username>/<repository-name>.git
cd <repository-name>
```

### 2. Docker-Image erstellen

Baue das Docker-Image:
```bash
docker build -t react-app .
```

### 3. Docker-Container starten

Führe den Container aus und leite den Port 5173 auf deinen Host weiter:
```bash
docker run -p 5173:5173 --name react-app-container react-app
```

Die App ist jetzt unter **http://localhost:5173** erreichbar.

---

## Entwicklungsmodus (lokal ohne Docker)

Falls du die App lokal ausführen möchtest, ohne Docker:

1. Installiere die Abhängigkeiten:
   ```bash
   npm install
   ```

2. Starte die App:
   ```bash
   npm run dev
   ```

Die App wird standardmäßig unter **http://localhost:5173** laufen.

---

## Produktionsmodus (Docker)

Wenn du die App in einem Produktionsumfeld bereitstellen willst, stelle sicher, dass der Docker-Container mit Nginx richtig konfiguriert ist. Das Dockerfile ist für eine Multi-Stage-Build-Pipeline vorbereitet und optimiert.

### Produktions-Dockerfile

Das Dockerfile enthält die folgenden Schritte:

1. **Bauen der App:** 
   - Das Projekt wird mit `npm run build` gebaut.

2. **Bereitstellung mit Nginx:**
   - Die gebauten Dateien werden in ein leichtgewichtiges Nginx-Image kopiert.

---

## Nützliche Befehle

- **Container stoppen:**
  ```bash
  docker stop react-app-container
  ```

- **Container entfernen:**
  ```bash
  docker rm react-app-container
  ```

- **Docker-Images auflisten:**
  ```bash
  docker images
  ```

- **Gestoppte Container entfernen:**
  ```bash
  docker container prune
  ```

---

## Probleme beheben

Falls die App nicht erreichbar ist:

1. Stelle sicher, dass der Container läuft:
   ```bash
   docker ps
   ```

2. Überprüfe die Logs des Containers:
   ```bash
   docker logs react-app-container
   ```

3. Stelle sicher, dass der Port 5173 nicht von einer anderen Anwendung blockiert wird.

---


