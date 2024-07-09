provider "aws"{
region= "us-west-2"

}

resource "aws_instance" "ec2_example" {
  ami = "ami-00970f57473724c10"
  instance_type = var.instance_type
  tags = {
    Name = "terraform EC2"
  }
}

variable "instance_type" {
    description = "The instance type is t2.micro"
    type = string
    default = "t2.micro"
  
}
