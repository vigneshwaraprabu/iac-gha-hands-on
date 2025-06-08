## Project Structure & Feature Branches

This repository is organized using feature-based branching, with each branch focused on a core infrastructure capability. Below is a summary of each key branch:

---

### `feature/iac`
Contains all **Infrastructure as Code (IaC)** components using Terraform.  
Included resources:
- ECS Fargate cluster and service
- RDS (PostgreSQL) with Multi-AZ failover
- ElastiCache (Redis)
- S3 buckets for static assets
- IAM roles, networking, and autoscaling

---

### `feature/ci-cd`
Implements the complete **CI/CD pipeline** using GitHub Actions.  
Key functionalities:
- Linting (`flake8`)
- Unit testing (`pytest`)
- Docker image build and push to Amazon ECR
- Terraform validation and apply in a non-prod workspace
- ECS deployment with zero-downtime rolling updates
- Simulated Gemini security scan

---

### `feature/observability`
Adds **observability tools** to the stack.  
Includes:
- CloudWatch Agent configuration for logs and metrics
- Custom application metrics (e.g., latency, error rate)
- Centralized log collection from application logs
- StatsD/CollectD integration for ECS or EC2

---

### `feature/security`
Focuses on **security best practices and automation**.  
Highlights:
- Simulated security scans via the Gemini API
- Markdown-based security reports posted to PRs
- Terraform security linting in CI

---
