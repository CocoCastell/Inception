# Developer Documentation

This document explains how to set up the development environment from scratch, build and run the project using Docker Compose and Make, manage containers and volumes, and understand how project data is stored and persisted.

---

## 1. Prerequisites

Make sure the following tools are installed on your machine:

- **Docker** ≥ 20.x  
- **Docker Compose** (v2, bundled with Docker Desktop)
- **Make** ≥ 4.x
- **Git**
- *(Optional but recommended)*  
  - `bash`
  - `curl`

Verify installation:

```bash
docker --version
docker compose version
make --version

---

## 2. How to set up and run
git clone <REPOSITORY_URL> <PROJECT_DIRECTORY>
cd <PROJECT_DIRECTORY>

Edit the .env file with the required values

To run:
```
make build
```
```
docker compose up -d --build
```

To stop:
```
make down
```
```
docker compose down
```

## 3. Relevant docker commands
docker ps
docker ps -a
docker container ls
docker logs <container>
docker volume ls
docker volume inspect <container>
docker exec -t <container> <programm/command>
docker compose down -v
docker system df

