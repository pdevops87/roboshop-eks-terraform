terraform {
  backend "s3" {
    bucket         = "bucketinfo23"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"

  }
}


