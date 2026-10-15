
# Production-Oriented Terraform on AWS

## Overview

A hands-on infrastructure engineering project focused on building,
validating, reviewing, and safely managing AWS infrastructure with Terraform.

This repository progresses from reusable Terraform modules to
environment isolation, remote state management, drift detection,
and CI/CD workflows.

## Learning Objectives

- Design reusable Terraform modules.
- Separate development and staging configurations.
- Understand Terraform state, locking, and recovery.
- Detect infrastructure drift and import existing resources.
- Review execution plans before infrastructure changes.
- Automate formatting and validation with GitHub Actions.
- Apply infrastructure changes using controlled workflows.

## Repository Structure

```text
.
├── docs/
├── modules/
├── environments/
├── .github/workflows/
├── .gitignore
└── README.md
```

## Engineering Workflow

1. Create a feature branch.
2. Implement a small infrastructure change.
3. Run `terraform fmt -check -recursive`.
4. Run `terraform validate`.
5. Generate and review a Terraform plan.
6. Commit the change and open a pull request.
7. Apply approved changes through a controlled workflow.

## Safety Principles

- Never commit credentials, private keys, or Terraform state.
- Use least-privilege AWS permissions.
- Separate state between environments.
- Review resource replacements and deletions carefully.
- Protect production changes with appropriate approvals.
- Treat state backups and recovery as part of operations.

## Project Status

Currently establishing the repository structure and reusable
Terraform module foundation.

## Disclaimer

This is a learning project. All AWS resources must be reviewed
for security, operational impact, and cost before deployment.
