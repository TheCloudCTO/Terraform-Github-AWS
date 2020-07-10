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
