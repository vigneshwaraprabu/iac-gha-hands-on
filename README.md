# Terraform Infrastructure Deployment

This project contains Terraform configuration to provision and manage AWS infrastructure components such as ECS, RDS, S3, and more.

---

## Prerequisites

Make sure you have the following installed:

- [Terraform CLI](https://www.terraform.io/downloads.html)
- AWS CLI configured (`aws configure`)
- IAM user/role with necessary permissions
- Backend (e.g., S3 + DynamoDB) configured if using remote state

---

##  Setup & Initialization

### 1. Clone the repository

```bash
git clone https://github.com/your-org/your-repo.git
cd your-repo/terraform
```

### 2. Initialize Terraform
```bash
terraform init
```

### (Optional) Select or Create a Workspace
```bash
terraform workspace list
terraform workspace select non-prod || terraform workspace new non-prod
```

### 3. Plan Infrastructure Changes
```bash
terraform plan -out=tfplan
```

### 4. Apply the Changes
```bash
terraform apply tfplan
```
>Always review the plan before applying in production environments.
