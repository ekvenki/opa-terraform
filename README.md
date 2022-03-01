# opa-terraform
To create a Open Policy Agent for terraform scripts while provisioning S3 bucket

# Step-1: Download OPA
curl -L -o opa https://openpolicyagent.org/downloads/v0.35.0/opa_linux_amd64_static

# Step-2: Write a sample terraform code to apply OPA
The code is available in main.tf which deals about provisioning of S3 bucket in AWS account

# Step-3: OPA Scripts
The code is available at S3 folder

# Step-4: Convert Terraform plan as JSON with following commands
1. terraform plan -out plantf
![Uploading image.png…]()


2. terraform show -json plantf > plan.json

# Step-5: Run OPA

