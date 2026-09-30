# Multi-Cloud Infrastructure Automation with Ansible

## Objectives
* Automated multi-cloud infrastructure provisioning across Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP) using Infrastructure as Code (IaC).
* Configured provider credentials and API integrations using modern collection modules.
* Implemented dynamic inventories for auto-discovery of instances based on tags, labels, and regions.
* Executed centralized multi-cloud configuration management and teardown playbooks.

## Tools Used
* **Automation Tool:** Ansible Core 2.16+, Ansible Galaxy Collections (`amazon.aws`, `azure.azcollection`, `google.cloud`, `community.crypto`)
* **SDK Libraries:** `boto3`, `azure-mgmt-compute`, `google-auth`
* **Target Cloud Platforms:** AWS (EC2), Azure (Virtual Machines), GCP (Compute Engine)
* **Utilities:** Bash, Python 3.12, `jq`, Virtual Environments

## Key Skills Demonstrated
* Enterprise Infrastructure as Code (IaC) design and playbooks modularization
* Cross-cloud authentication mechanisms (AWS Access Keys, Azure Service Principals, GCP Service Account JSON)
* Dynamic inventory plugin configuration and hybrid inventory scripting
* Troubleshooting deprecated Ansible modules and resolving modern environment variables scope

## Troubleshooting Log
* **Issue 1:** Deprecated `openssh_keypair` module execution.
  * *Fix:* Updated module namespace to `community.crypto.openssh_keypair`.
* **Issue 2:** `ansible_env.GOOGLE_APPLICATION_CREDENTIALS` failing to fetch environment paths.
  * *Fix:* Standardized variable lookups using `lookup('env', 'GOOGLE_APPLICATION_CREDENTIALS')`.
* **Issue 3:** Deprecated `include` keyword in playbooks orchestration.
  * *Fix:* Refactored to standard `ansible.builtin.import_playbook` statements.
