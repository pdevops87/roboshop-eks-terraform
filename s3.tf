terraform {
  backend "s3" {
    bucket         = "bucketinfo23"
    key            = "state/dev/terraform.tfstate"
    region         = "us-east-1"

  }
}


