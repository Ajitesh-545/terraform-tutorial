terraform {
  backend "s3" {
    bucket = "terraform-bucket-ajitesh"
    key = "key/terraform.tfstate"
    region = "us-west-2"
  }
}


provider "aws" {
  region = "us-west-2"
}
resource "aws_instance" "ec2-example" {
  ami = "ami-0efcece6bed30fd98"
  instance_type = "t2.nano"
  tags = {
    Name="Terraform EC2"
  }
}