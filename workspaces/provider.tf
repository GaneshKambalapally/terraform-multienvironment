

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.69.0"
    }
  }

  backend "s3" {
    bucket = "ganesh-remotestate"
    key    = "workspaces"
    region = "us-east-1"
    dynamodb_table = "Ganesh-locking"
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

