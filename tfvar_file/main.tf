provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "ec2-example-tfvars" {

    ami = "ami-00970f57473724c10"
    instance_type = var.instance_type
    tags = {
      Name = "ec2-example-tf-vars-files"
    }
  
}