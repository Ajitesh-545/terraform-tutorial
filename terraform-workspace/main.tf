provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "ec2-example" {
  ami = "ami-0efcece6bed30fd98"
  instance_type = var.instance_size
  tags = {
    Name=var.env_name
  }
}