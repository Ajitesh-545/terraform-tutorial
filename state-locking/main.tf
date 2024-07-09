provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0efcece6bed30fd98"
    instance_type = "t2.nano"
    tags = {
      Name="Terraform example"
    }
}

terraform {
  backend "s3" {
    bucket = "terraform-bucket-ajitesh"
    key = "remote-locking/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "dynamoDB-state-locking"
    encrypt = false
  }
}