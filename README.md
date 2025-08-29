# AWS CDK Infrastructure Project

This project manages AWS infrastructure using AWS CDK (TypeScript).  
Currently includes a DynamoDB table, with plans to add frontend and other resources.

---

## Prerequisites

- Node.js >= 20
- Yarn or npm
- AWS CLI configured with a user that has AdministratorAccess
- AWS CDK installed globally (`npm install -g aws-cdk`)

---

## Project Setup

1. Install dependencies:  
   `yarn install`

2. Build TypeScript:  
   `yarn build`

---

## Bootstrapping AWS Environment

The CDK requires a bootstrap stack to create S3 buckets for assets and roles for deployments.

`cdk bootstrap aws://<AWS_ACCOUNT_ID>/<AWS_REGION>`

Replace `<AWS_ACCOUNT_ID>` with your AWS account ID and `<AWS_REGION>` with your desired AWS region (e.g., `sa-east-1`).

The default bootstrap bucket will be created as:  
`cdk-hnb659fds-assets-<account>-<region>`

---

## Deploying Stacks

`cdk deploy --context stage=dev --app "npx ts-node bin/infra.ts" --region <AWS_REGION>`

- `--context stage=dev` sets the environment prefix (`dev-` or `prd-`)
- `--region <AWS_REGION>` ensures all resources are created in the correct region

> You can create multiple stacks for frontend, backend, databases, etc., following the same structure.

---

## Useful Commands

- Check active AWS user:  
  `aws sts get-caller-identity`

- List CDK bootstrap buckets:  
  `aws s3 ls | grep cdk-hnb659fds-assets`

- Delete a bucket (force delete all objects):  
  `aws s3 rb s3://cdk-hnb659fds-assets-<account>-<region> --force`

- Delete bootstrap stack:  
  `aws cloudformation delete-stack --stack-name CDKToolkit --region <AWS_REGION>`

- Diff / See planned changes:  
  `cdk diff --context stage=dev --app "npx ts-node bin/infra.ts"`

---

## Common Issues

1. **Bucket not found / Cannot publish assets**
   - Ensure bootstrap stack exists in the correct region.
   - Ensure your user has `s3:PutObject`, `s3:GetObject`, and `s3:ListBucket` permissions.

2. **Deploying to wrong region**
   - Always pass `--region <AWS_REGION>`. CDK assets buckets are region-specific.

3. **TypeScript build errors**
   - Ensure `bin` and `lib` folders are included in `tsconfig.json`:  
     `"include": ["bin/**/*.ts", "lib/**/*.ts"]`

---

## References

- [AWS CDK Documentation](https://docs.aws.amazon.com/cdk/latest/guide/home.html)
- [AWS DynamoDB](https://docs.aws.amazon.com/dynamodb/)
