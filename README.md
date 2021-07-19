## 1. How to create a Terraform Remote Backend with AWS S3 with SSE Encryption and Dynamo DB for the backend
This is a tutorial to understand and use AWS Terraform in a team with a remote backend (Terraform Enterprise is better for big teams). Make sure you have installed Terraform guide @ https://learn.hashicorp.com/tutorials/terraform/install-cli

```
$ git clone https://github.com/Cobra16319/TF-Backend-Example.git"
```

![image](https://user-images.githubusercontent.com/46206055/126203906-f8cc1e0d-6233-4d20-9877-df00687ffc38.png)

Ensure you comment out the backend config with a # /// This will allow you to first check your credentials and create the S3 bucket and data base first. Once in that order they are created. Also, ensure you have your credentials i.e in Vault or encrypted as you see fit. In the relitive path i.e. ["/home/server_name/.aws/ninja/cred"] also remember S3 is global and to ensure a unique naming convention for dev, staging, prod etc...  Once complete 

```
$ terraform init
```
```
$ terraform plan
```
```
$ terraform apply
```
 

## 2. Initiate the terraform backend

Uncomment the TF backend configuration once you have succesfuly deployed the TF backend.

```
$ terraform init
```



## Congratulations Now your TF Backend is configured! If you run into trouble the HashiCorp Discuss is a great resource... You can find me there @ https://discuss.hashicorp.com/u/cobra16319
