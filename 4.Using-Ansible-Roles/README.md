# Enterprise Modular Webserver Ansible Role Architecture

## Objectives
- Implement modular Infrastructure-as-Code (IaC) design using standardized Ansible Roles.
- Abstract configuration layers across `defaults`, `vars`, `tasks`, `handlers`, and `templates`.
- Implement dynamic Jinja2 templating for VirtualHost configuration and HTML rendering.
- Build automated test assertions verifying service status, port availability, and HTTP payloads.

## Tools Used
- **Configuration Management:** Ansible Core 2.14+
- **Web Engine:** Apache2
- **Templating:** Jinja2
- **Language/Format:** YAML, Linux Systemd

## Key Skills Demonstrated
- Ansible Role structure initialization and variable precedence management.
- Idempotent handler notifications (`notify` trigger loops).
- Pre-flight syntax validation (`apache2ctl configtest`) and URI assertion testing.

## Troubleshooting Log
- **Port Binding Conflicts:** Enforced strict regex matching (`^Listen `) in `lineinfile` operations to prevent duplicate port binding syntax errors in Apache configuration files.
