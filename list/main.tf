provider "aws"{
region= "us-west-2"

}

resource "aws_instance" "ec2_example" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  count = 1
  tags = {
    Name = "terraform EC2"
  }
}

resource "aws_iam_user" "user_list" {
    count = length(var.user_name)
    name = var.user_name[count.index]
}

variable "user_name" {
    description = "List of iam user"
    type = list(string)
    default = [ "user1", "user2", "user3" ]
}