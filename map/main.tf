provider "aws"{
region= "us-west-2"

}

resource "aws_instance" "ec2_example" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  tags = var.project_environment
}

variable "project_environment" {
    description = "project name and environment"
    type=map(string)
    default = {
      "project" = "project-alpha",
      "environment" = "dev"
    }
  
}