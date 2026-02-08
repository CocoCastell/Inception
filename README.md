*This project has been created as part of the 42 curriculum by cochatel42.*

# Description
This project is an introduction to system administration using the tool Docker.
It is a project focused on deploying a complete web stack using Docker containers and Docker compose.The goal is to create a fully functional WordPress site running with Nginx in HTTPS, connected to a MariaDB database.

# Instructions
- Project done on a VM
- Docker and Docker Compose installed
- For instructions on how tu run the program, read the DEV_DOC.md file

## Ressources

https://docs.docker.com/  
https://tuto.grademe.fr/inception/#wordpress  
https://medium.com/@ssterdev/inception-guide-42-project-part-i-7e3af15eb671  
https://openclassrooms.com/en/courses/7905646-optimize-your-deployment-with-docker-containers  
https://www.youtube.com/watch?v=3c-iBn73dDE  

AI was used to understand Linux commands, deepen knowledge of Linux concepts, obtain debugging techniques relevant to the project and analyze how APK packages and their permission assignments work in Alpine.

## About Inception

The result project is a full stack web composed of:

-**Web server** – nginx
-**Web application** – wordpress and PHP-FPM
-**Database** – mariadb

**Use of Docker:**  
Docker is used to isolate each service in its own container, ensuring that the application runs consistently across different machines. Docker Compose orchestrates the containers, networks, and volumes for easy setup and teardown.

---

# 2. Main Design Choices

- **Containerization**: Each service runs in a separate container for isolation.  
- **Volumes for persistence**: Databases and uploaded files are stored in Docker volumes.  
- **Environment variables**: Configurations and secrets are injected via `.env`.  
- **Networks**: Services communicate over a Docker network to avoid exposing internal services directly to the host.  

---

## 3. Comparisons

### 3.1 Virtual Machines vs Docker

| Feature | Virtual Machines | Docker Containers |
|---------|-----------------|-----------------|
| Isolation | Full OS isolation | Process-level isolation |
| Resource usage | Heavy, requires full OS per VM | Lightweight, shares its kernel with the host|
| Startup time | Slower | Faster|
| Portability | OS-dependent | Highly portable |

Docker is ideal for microservice applications and development because it is lightweight, fast, and reproducible.
VM are a full separate computer on the host and have their own OS, need more resources, and take longer to start.  

---

### 3.2 Secrets vs Environment Variables

| Feature | Secrets | Environment Variables |
|---------|---------|---------------------|
| Security | Encrypted and managed | Plain text (in `.env`) |
| Persistence | Stored in Docker Secret manager | Stored in `.env` file or passed to container |
| Use case | Sensitive data (passwords, API keys) | General configuration values |
| Visibility | Not visible in process env by default | Visible to processes and anyone reading `.env` |

**Takeaway:** Use secrets for production sensitive data, environment variables for general configuration and development convenience.

---

### 3.3 Docker Network vs Host Network

| Feature | Docker Network (bridge) | Host Network |
|---------|------------------------|--------------|
| IP isolation | Containers get private IPs | Containers share host IP |
| Port mapping | Required to expose services | No port mapping needed |
| Security | Stronger isolation | Less isolation, risk of conflicts |
| Use case | Default choice for multi-container apps | Special cases (high-performance network, low-latency apps) |

**Takeaway:** Use Docker bridge networks for most applications; host networking is only necessary when performance outweighs isolation.

---

### 3.4 Docker Volumes vs Bind Mounts

| Feature | Docker Volumes | Bind Mounts |
|---------|----------------|------------|
| Location | Managed by Docker | Maps directly to host filesystem |
| Portability | Portable with `docker-compose` | Dependent on host paths |
| Backup & migration | Easy to backup | Needs manual management |
| Use case | Persistent data like databases | Development (code mounting) |

**Takeaway:** Use volumes for app data that should persist independently from the host. Use bind mounts for local development and live editing of code.
