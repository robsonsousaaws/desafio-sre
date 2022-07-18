provider "aws" {
  region  = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-linuxtips-robson"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}