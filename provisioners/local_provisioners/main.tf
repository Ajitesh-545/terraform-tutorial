provider "aws"{
region= "us-west-2"
}

resource "aws_instance" "ec2_example" {
  ami = "ami-0efcece6bed30fd98"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform EC2"
  }
provisioner "local-exec" {
    command = "touch local-exec.txt"
}

}
