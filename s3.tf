terraform {
  backend "s3" {
    bucket         = "bucketinfo23"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "statefile"
  }
}


resource "aws_dynamodb_table" "example"{
  hash_key = "dbfile"
  name     = "statefile"
  attribute {
    name = "dbfile"
    type = "S" // here s is a string
  }
}