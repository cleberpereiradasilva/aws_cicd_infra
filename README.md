# 🏗 Insurance Project Infrastructure (Terraform)

This project manages the AWS infrastructure for the Insurance Project using **Terraform**.  
We maintain **separate environments** for `dev` and `prod` to ensure safety and isolation.

---

## 🌎 Environment Overview

- **Dev Environment**:
  - Prefix: `dev-*`
  - AWS Region: **Virginia (us-east-1)**
  - GitHub Secrets: `AWS_DEV_REGION`, `AWS_DEV_ACCESS_KEY_ID`, `AWS_DEV_SECRET_ACCESS_KEY`, `AWS_CDK_DEV_S3`
  - Terraform State Bucket: `dev-terraform-state-{suffix}` (manual creation required)

- **Prod Environment**:
  - Prefix: `prod-*`
  - AWS Region: **São Paulo (sa-east-1)**
  - GitHub Secrets: `AWS_PRD_REGION`, `AWS_PRD_ACCESS_KEY_ID`, `AWS_PRD_SECRET_ACCESS_KEY`, `AWS_CDK_PRD_S3`
  - Terraform State Bucket: `prd-terraform-state-{suffix}` (manual creation required)

> ⚠️ The `suffix` variable in the root `variables.tf` is required for **uniqueness of the S3 bucket names**.

---

## 👥 GitHub Accounts & Policies

We recommend **two separate GitHub accounts** for CI/CD:

- `dev` account → uses `dev-policy.md`
- `prod` account → uses `prod-policy.md`

> Copy the corresponding policy file to your IAM user in AWS.

---

## 📦 Initial Terraform Buckets

Before running Terraform, **manually create the state buckets**:

- `dev-terraform-state-{suffix}`
- `prd-terraform-state-{suffix}`

> These buckets will be used for Terraform remote state storage.

---

## 🔑 GitHub Secrets

### Dev

- AWS_DEV_REGION
- AWS_DEV_ACCESS_KEY_ID
- AWS_DEV_SECRET_ACCESS_KEY
- AWS_CDK_DEV_S3

### Prod

- AWS_PRD_REGION
- AWS_PRD_ACCESS_KEY_ID
- AWS_PRD_SECRET_ACCESS_KEY
- AWS_CDK_PRD_S3

---

## 🛠 Useful Commands

### List Buckets

```
$ aws s3 ls
```

### Delete all dev buckets (can be adapted for prod)

```
$ for bucket in $(aws s3api list-buckets --query "Buckets[].Name" --output text | tr '\t' '\n' | grep '^dev-'); do
  echo "Deleting bucket: $bucket"
  aws s3 rb s3://$bucket --force
done
```

---

## 🌱 Branches & CI/CD

- The pipeline triggers on **`main`** and **`develop`** branches.
- Ensure you have a **`develop`** branch for dev deployments.

---

## 🗂 Terraform Folder Structure

```

├── README.md
├── prd-policy.md
├── dev-policy.md
├── bootstrap
│ └── main.tf
├── bucket
│ ├── documents.tf
│ ├── outputs.tf
│ ├── variables.tf
│ └── web-files.tf
├── cloudfront
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
├── dynamodb
│ ├── clients.tf
│ ├── insurers.tf
│ ├── proposals.tf
│ └── variables.tf
├── main.tf
└── variables.tf
```

> 📝 Each environment uses **prefixes (`dev-*` / `prod-*`)** to prevent accidental cross-environment changes.

---

## ⚡ Tips

- Always double-check **region variables** when running Terraform.
- Make sure the initial state buckets exist **before running any pipeline**.
- Dev environment is cheaper and faster for testing; Prod is in São Paulo for latency with the main app.

---

🚀 **Happy Deploying!**

```

```
