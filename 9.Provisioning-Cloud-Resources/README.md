# Enterprise AWS Provisioning & IaC Management via Ansible

## Objectives
- Configure Ansible to authenticate securely with AWS cloud services using `boto3` and `amazon.aws`.
- Programmatically provision EC2 Compute instances, EC2 SSH Key pairs, and VPC Security Groups.
- Generate dynamic inventory files (`aws-inventory.ini`) for newly provisioned compute resources.
- Execute automated infrastructure health verifications and teardown procedures.

## Tools & Requirements
- **Automation Engine:** Ansible 2.14+
- **Ansible Galaxy Collection:** `amazon.aws`
- **Python SDKs:** `boto3`, `botocore`
- **Target Provider:** Amazon Web Services (AWS)

## Architectural Highlights
- **Dynamic Metadata Resolution:** Queries default VPC ID via `amazon.aws.ec2_vpc_info` to eliminate hardcoded networking variables.
- **Declarative Resource States:** Maintains idempotent cloud infrastructure states across multiple executions.
- **Automated Lifecycle Teardown:** Ensures instance termination before attempting security group destruction to avoid AWS `DependencyViolation` locks.

## Deployment Verification
Provision and verify the AWS infrastructure stack:
```bash
ansible-playbook playbooks/complete-infrastructure.yml
ansible-playbook playbooks/verify-infrastructure.yml
