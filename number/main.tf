provider "aws"{
region= "us-west-2"

}

resource "aws_instance" "ec2_example" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  count = var.instance_count
  tags = {
    Name = "terraform EC2"
  }
}

variable "instance_count" {
    description = "The instance count is 2"
    type = number
    default = 2
  
}
