# 🥚 Nest — Corporate Innovation Platform API

<p align="center">
  <img src="https://img.shields.io/badge/Java-21-orange?style=for-the-badge&logo=openjdk" />
  <img src="https://img.shields.io/badge/Spring_Boot-4.0.6-6DB33F?style=for-the-badge&logo=springboot" />
  <img src="https://img.shields.io/badge/Oracle-DB-F80000?style=for-the-badge&logo=oracle" />
  <img src="https://img.shields.io/badge/Flyway-Migrations-CC0200?style=for-the-badge&logo=flyway" />
  <img src="https://img.shields.io/badge/JWT-Auth-000000?style=for-the-badge&logo=jsonwebtokens" />
  <img src="https://img.shields.io/badge/Docker-Compose-2496ED?style=for-the-badge&logo=docker" />
</p>

> REST API for **Nest**, GAB Group's corporate innovation platform. Manages the full innovation lifecycle — from idea capture to ROI dashboard — with role-based access control for Operators, Managers and Leaders.

---

## 📖 About

**Nest** is a corporate innovation management platform.

The name "Nest" comes from **ninho** (nest) — the place where the eagle creates, protects and develops. The platform organizes the entire innovation journey into 4 sequential phases:

```
💡 CAPTURE  ──►  🥚 HATCH  ──►  🪽 FLIGHT  ──►  📈 IMPACT
```

| Phase | Description |
|---|---|
| **Capture** | Operators register operational pain points and ideas |
| **Hatch** | Managers evaluate, prioritize and approve ideas |
| **Flight** | Approved ideas become structured projects in execution |
| **Impact** | Leaders visualize ROI, savings and operational results |

---

## 🏗️ Architecture

```
nest-gab-api/
├── src/main/java/br/com/gabnest/nest_gab_api/
│   ├── config/                  # Security and app configuration
│   │   └── SecurityConfig.java
│   ├── controller/              # REST Controllers
│   │   ├── AuthController.java
│   │   ├── GuidelineController.java
│   │   ├── IdeaController.java
│   │   ├── ProjectController.java
│   │   └── DashboardController.java
│   ├── dto/                     # Data Transfer Objects
│   │   ├── auth/
│   │   ├── guideline/
│   │   ├── idea/
│   │   ├── project/
│   │   └── user/
│   ├── model/                   # JPA Entities
│   │   ├── enums/
│   │   │   ├── UserRole.java
│   │   │   ├── IdeaStatus.java
│   │   │   ├── ProjectStatus.java
│   │   │   └── ProjectStage.java
│   │   ├── User.java
│   │   ├── StrategicGuideline.java
│   │   ├── Idea.java
│   │   └── Project.java
│   ├── repository/              # Spring Data JPA Repositories
│   ├── security/                # JWT Filter
│   │   └── JwtAuthFilter.java
│   └── service/                 # Business Logic
│       ├── AuthService.java
│       ├── JwtService.java
│       ├── UserDetailsServiceImpl.java
│       ├── GuidelineService.java
│       ├── IdeaService.java
│       ├── ProjectService.java
│       └── DashboardService.java
└── src/main/resources/
    ├── application.properties
    └── db/migration/            # Flyway Migrations
        ├── V1__create_sequences.sql
        ├── V2__create_tables.sql
        └── V3__insert_seed_data.sql
```

---

## 🛠️ Tech Stack

| Technology | Version | Purpose |
|---|---|---|
| Java | 21 | Language |
| Spring Boot | 4.0.6 | Framework |
| Spring Security | 7.x | Authentication & Authorization |
| Spring Data JPA | 4.x | ORM |
| Hibernate | 7.x | JPA Implementation |
| Oracle Database | 23c Free | Database |
| Flyway | latest | Database Migrations |
| JJWT | 0.12.6 | JWT Token Generation |
| Lombok | latest | Boilerplate Reduction |
| Docker | latest | Containerization |

---

## ⚙️ Prerequisites

- [Java 21+](https://adoptium.net/)
- [Maven 3.9+](https://maven.apache.org/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/seu-usuario/nest-gab-api.git
cd nest-gab-api
```

### 2. Start the Oracle Database

```bash
docker compose up -d
```

This will start an Oracle 23c Free container with:
- Port: `1521`
- Service: `FREEPDB1`
- User: `nestdba`
- Password: `nest123`

> ⚠️ The first startup takes **2-3 minutes** for Oracle to initialize. Monitor the logs:

```bash
docker logs -f nest-oracle
```

Wait until you see:
```
DATABASE IS READY TO USE!
Executing user defined scripts
Grant succeeded.
DONE: Executing user defined scripts
```

### 3. Run the application

```bash
mvn spring-boot:run
```

Flyway will automatically run all migrations and seed the database on startup.

### 4. Verify

```bash
curl http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"carlos.operador@aguiabranca.com.br","password":"nest123"}'
```

---

## 🐳 Docker Compose

```yaml
services:
  oracle-db:
    image: container-registry.oracle.com/database/free:latest
    container_name: nest-oracle
    environment:
      - ORACLE_PWD=nest123
    ports:
      - "1521:1521"
    volumes:
      - oracle-data:/opt/oracle/oradata
      - ./docker/oracle/init:/opt/oracle/scripts/startup

volumes:
  oracle-data:
```

### Useful Docker commands

```bash
# Start containers
docker compose up -d

# Stop containers (keeps data)
docker compose down

# Stop and remove all data (full reset)
docker compose down -v

# View Oracle logs
docker logs -f nest-oracle

# Access Oracle SQL*Plus directly
docker exec -it nest-oracle sqlplus nestdba/nest123@FREEPDB1
```

---

## 🗄️ Database

### Migrations (Flyway)

| Migration | Description |
|---|---|
| `V1__create_sequences.sql` | Creates sequences for all entities |
| `V2__create_tables.sql` | Creates all tables with constraints |
| `V3__insert_seed_data.sql` | Inserts initial test data |

### Data Model

```
TB_USER
  id, name, email, password, role, active, created_at, updated_at

TB_STRATEGIC_GUIDELINE
  id, title, content, active, created_by (FK), created_at, updated_at

TB_IDEA
  id, title, description, status, priority,
  submitted_by (FK), reviewed_by (FK), reviewed_at,
  created_at, updated_at

TB_PROJECT
  id, title, description, status, stage,
  investment, expected_return, actual_return, productivity_gain,
  start_date, end_date, created_by (FK), idea_id (FK),
  created_at, updated_at
```

### Seed Users

| Name | Email | Password | Role |
|---|---|---|---|
| Carlos Operador | carlos.operador@aguiabranca.com.br | nest123 | OPERATOR |
| Ana Gestora | ana.gestora@aguiabranca.com.br | nest123 | MANAGER |
| Roberto Lider | roberto.lider@aguiabranca.com.br | nest123 | LEADER |

---

## 🔐 Authentication

The API uses **JWT (JSON Web Token)** for stateless authentication.

### Login

```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "carlos.operador@aguiabranca.com.br",
  "password": "nest123"
}
```

**Response:**
```json
{
  "token": "eyJhbGciOiJIUzUxMiJ9...",
  "userId": 1,
  "name": "Carlos Operador",
  "role": "OPERATOR"
}
```

### Register

```http
POST /api/auth/register
Content-Type: application/json

{
  "name": "Novo Colaborador",
  "email": "novo@aguiabranca.com.br",
  "password": "senha123"
}
```

> New users are always registered with `OPERATOR` role by default.

### Using the token

Include the token in all subsequent requests:

```http
Authorization: Bearer eyJhbGciOiJIUzUxMiJ9...
```

---

## 📡 API Endpoints

### Role-based Access Control

| Endpoint | OPERATOR | MANAGER | LEADER |
|---|---|---|---|
| `GET /api/guidelines` | ✅ | ✅ | ✅ |
| `POST /api/guidelines` | ❌ | ❌ | ✅ |
| `PUT /api/guidelines/{id}` | ❌ | ❌ | ✅ |
| `DELETE /api/guidelines/{id}` | ❌ | ❌ | ✅ |
| `POST /api/ideas` | ✅ | ❌ | ❌ |
| `GET /api/ideas/my` | ✅ | ❌ | ❌ |
| `GET /api/ideas` | ❌ | ✅ | ❌ |
| `PATCH /api/ideas/{id}/review` | ❌ | ✅ | ❌ |
| `POST /api/projects` | ❌ | ✅ | ❌ |
| `PUT /api/projects/{id}` | ❌ | ✅ | ❌ |
| `GET /api/projects` | ❌ | ✅ | ✅ |
| `GET /api/dashboard` | ❌ | ❌ | ✅ |

### Strategic Guidelines

```
GET    /api/guidelines          # List active guidelines
GET    /api/guidelines/{id}     # Get guideline by id
POST   /api/guidelines          # Create guideline (LEADER)
PUT    /api/guidelines/{id}     # Update guideline (LEADER)
DELETE /api/guidelines/{id}     # Soft delete guideline (LEADER)
```

### Ideas

```
POST   /api/ideas               # Submit idea (OPERATOR)
GET    /api/ideas               # List all ideas (MANAGER)
GET    /api/ideas?status=       # Filter by status (MANAGER)
GET    /api/ideas/my            # List my ideas (OPERATOR)
GET    /api/ideas/{id}          # Get idea by id
PATCH  /api/ideas/{id}/review   # Review idea (MANAGER)
```

**Idea Status Flow:**
```
PENDING  ──►  PRIORITIZED  ──►  APPROVED
                              └──►  REJECTED
```

### Projects

```
POST   /api/projects            # Create project (MANAGER)
GET    /api/projects            # List all projects (MANAGER, LEADER)
GET    /api/projects/{id}       # Get project by id (MANAGER, LEADER)
PUT    /api/projects/{id}       # Update project (MANAGER)
```

**Project Status:** `PLANNING` → `IN_PROGRESS` → `COMPLETED` / `CANCELLED`

**Project Stage:** `IDEATION` → `VALIDATION` → `PLANNING` → `EXECUTION` → `MONITORING` → `COMPLETED`

### Dashboard

```
GET    /api/dashboard           # ROI summary and metrics (LEADER)
```

**Response includes:** Total ROI (%), total savings, completed projects count, ideas implemented count, and project summaries.

---

## 🧪 Testing with Postman

Import the collection file `nest_gab_api.postman_collection.json` available in the repository root.

The collection includes:
- Pre-configured requests for all endpoints
- Automatic token saving after login via test scripts
- Collection variables for `token_operator`, `token_manager` and `token_leader`
- Access control validation requests (expected to return 403)

**Recommended test flow:**
```
1. Auth → Login Operator    (token saved automatically)
2. Auth → Login Manager     (token saved automatically)
3. Auth → Login Leader      (token saved automatically)
4. Run all business endpoints
5. Run Access Control Validation folder (all should return 403)
```

---

## 📝 Configuration

`src/main/resources/application.properties`

```properties
spring.application.name=nest-gab-api

# Database
spring.datasource.url=jdbc:oracle:thin:@localhost:1521/FREEPDB1
spring.datasource.username=nestdba
spring.datasource.password=nest123
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

# JPA
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true

# Flyway
spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration

# JWT
jwt.secret=nest-gab-super-secret-key-that-is-at-least-256-bits-long-for-hs256
jwt.expiration=86400000
```

---

## 👥 User Roles

| Role | Description | Permissions |
|---|---|---|
| `OPERATOR` | Front-line employees | Submit ideas, track own ideas, read guidelines |
| `MANAGER` | Coordinators and managers | Evaluate ideas, manage projects, read guidelines |
| `LEADER` | Company leadership | Manage guidelines, view all projects, access dashboard |

---

## 🔗 Related Repositories

| Repository | Description |
|---|---|
| `nest-gab-api` | This repository — Spring Boot REST API |
| `nest-app` | Android app (Kotlin + Jetpack Compose) |

---

<p align="center"><i>Nest — Where ideas are born 🥚</i></p>
