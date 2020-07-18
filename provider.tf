provider "aws" {
    profile = var.whodis
    region = var.location
}


resource "aws_instance" "temporary-instance" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
  tags = {
    Name = var.the_name
  }
}

terraform {
  backend "s3" {
    bucket = "thecloudcto-github-actions-tf-state"
    key    = "default-infrastructure"
    region = "us-east-1"
    profile = "cloudsmart-temp-acct-jake"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "thecloudcto-github-actions-tf-state"

  versioning {
    enabled = true
  }
}
