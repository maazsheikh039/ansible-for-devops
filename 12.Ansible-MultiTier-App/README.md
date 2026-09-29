# Multi-Tier Application Automation via Ansible Roles

## Objectives
- Automated deployment of a 3-tier web stack (Nginx Web Tier, Flask/Gunicorn App Tier, MySQL DB Tier).
- Implement modular Ansible roles (`database`, `application`, `webserver`) following standard directory conventions.
- Manage global operational variables and secrets using `group_vars/all/main.yml`.
- Manage Gunicorn WSGI using systemd units and reverse-proxy frontend requests via Nginx with security headers.
- Validate end-to-end data persistence and API routes.

## Architecture Stack
- **Web Tier:** Nginx (Reverse Proxy & Static HTML Frontend)
- **Application Tier:** Flask REST API managed by Gunicorn WSGI under `systemd`
- **Database Tier:** MySQL Server (`todoapp` database, `tasks` table)
- **Orchestration Tool:** Ansible 2.14+ (Python Virtual Environment)

## Project Layout

├── group_vars/
│   └── all/
│       └── main.yml
├── hosts
├── site.yml
└── roles/
├── application/
├── database/
└── webserver/

## End-to-End Verification
To verify the complete three-tier deployment stack:
```bash
# Verify backend API health proxying
curl -s http://localhost/health

# Submit new task entry via proxy
curl -s -X POST -H "Content-Type: application/json" \
  -d '{"title":"Production Test Task","status":"pending"}' \
  http://localhost/api/tasks

# Query all stored tasks
curl -s http://localhost/api/tasks
