# User Documentation

This document explains how to use the project as an end user or administrator:
what services are provided, how to start and stop the system, how to access the
website and administration interface.

---

## 1. Overview of the Services

The project runs as a stack of services managed by Docker.

Typical services include:

- **Web Application**
  - The main website accessible to end users
- **Administration Panel**
  - Interface reserved for administrators
- **Database**
  - Stores application data (users, content, settings, etc.)
- **Supporting Services**
  - Examples: cache, background workers, API services

All services run automatically together when the project is started.

---

## 2. Starting and Stopping the Project

### 2.1 Start the project

From the project directory, run:

```bash
docker compose up -d
