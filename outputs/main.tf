provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2-example" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  tags = {
    Name="test-ec2"
  }
}

output "output_string" {
    value = aws_instance.ec2-example.public_ip
    sensitive = false
  
}