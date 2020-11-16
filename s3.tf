#temp secret manager and aws provider 
provider "aws" {
  region                  = "us-west-2"
  shared_credentials_file = "/home/server_name/.aws/ninja/cred"
  profile                 = "customprofile"
}

# Configure s3 bucket for tf state (Do just the Provider S3 bucket and Dynamo DB first before the Backend)

resource "aws_s3_bucket" "globally-unique-state-bucket" {
  bucket = "globally-unique-state-bucket"

  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "Your_Name"
    Owner = "Someone"
    Application = "TF-Backend"
    Compliance = "Prod"
    Member_TF = true
  }
}




# Add this stanza below to YOUR main.tf see here for full docs https://www.terraform.io/docs/backends/init.html

terraform {
  backend "s3" {
    shared_credentials_file = "/home/server_name/.aws/ninja/cred"
    profile                 = "customprofile"
   bucket                   = "globally-unique-state-bucket"
    key                     = "home/ec2-user/environment/tf/terraform.tfstate"
    region                  = "us-west-2"
    dynamodb_table          = "tf-dev-state-lock"
    encrypt                 = true
  }
}
