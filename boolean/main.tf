provider "aws"{
region= "us-west-2"

}

resource "aws_instance" "ec2_example" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  associate_public_ip_address = var.enable_public_ip
  tags = {
    Name = "terraform EC2"
  }
}

variable "enable_public_ip" {
    description = "value"
    type = bool
    default = true
  
}
