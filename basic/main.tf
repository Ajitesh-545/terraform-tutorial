provider "aws"{
region= "us-west-2"
}

resource "aws_instance" "ec2_example" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform EC2"
  }
}