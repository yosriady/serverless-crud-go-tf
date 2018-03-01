# Serverless Go CRUD application with Terraform

## Setup

```
git clone git@github.com:yosriady/serverless-crud-go-tf.git
cd serverless-crud-go-tf
dep ensure
```

### Overview

- The Lambda functions lives in `handlers/`.  
- `main.tf` is a Terraform configuration for deploying the Lambdas.

## Build

```
./build.sh
```

This step will compile and compress `handlers/*.go` into `build/*.zip` files to be deployed to AWS Lambda.

## Deploy

1. Run `terraform init` to initialize the terraform repository.

2. Then run `terraform plan` to create the execution plan.

3. Finally, `terraform apply` to apply the changes (run the execution plan).

## Test handlers

```
aws lambda invoke \
--invocation-type RequestResponse \
--function-name hello \
--region ap-southeast-1 \
--log-type Tail \
--payload '"test"' \
outputfile.txt
```
