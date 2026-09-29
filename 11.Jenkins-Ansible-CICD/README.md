# Enterprise Jenkins CI/CD Pipeline Integration with Ansible

## Objectives
- Install and configure Jenkins automation server and Ansible configuration engine on Linux.
- Automate Jenkins initialization and administrative setups using Groovy API scripts and Jenkins CLI.
- Construct declarative Jenkins Pipelines for automated playbook syntax checks and application deployments.
- Build multi-environment, parameterized CD pipelines passing dynamic variables to Ansible playbooks.
- Execute automated post-deployment health verification suites.

## Tools & Requirements
- **CI/CD Orchestrator:** Jenkins 2.x (OpenJDK 11)
- **Configuration Engine:** Ansible 2.14+
- **Web Server:** Nginx
- **OS Platform:** Linux (Ubuntu)

## Architectural Highlights
- **Headless Pipeline Bootstrap:** Bypasses manual setup wizards via Groovy automation (`setup-jenkins.groovy`) and CLI configuration.
- **Passwordless Escalation:** Implements granular `sudoers` rights for the `jenkins` user to execute system-level playbook tasks safely.
- **Automated Quality Gates:** Combines playbook `--syntax-check`, Jinja2 HTML rendering verification, and HTTP 200 status tests directly into stage execution blocks.

## Deployment Verification
Execute automated health checks against the local continuous delivery pipeline:
```bash
~/jenkins-workspace/test-deployment.sh
curl -v http://localhost
