provider "aws" {
    region = "us-west-2"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0efcece6bed30fd98"
    instance_type = "t2.micro"
    key_name = "aws_key"
    vpc_security_group_ids = [ aws_security_group.main.id ]
    tags = {
      Name="terraform tutorital"
    }

    provisioner "remote-exec" {
      inline = [ 
        "touch remote-file.txt",
        "echo Appending content in the remote file >> remote-file.txt"
       ]
    }

    connection {
      type = "ssh"
      private_key = file("/home/ajitesh/myapps/terraform-tut/terraform_yt/provisioners/file_provisioners/aws_key")
      host = self.public_ip
      user = "ubuntu"
      timeout = "2m"
    }
}

resource "aws_security_group" "main" {
   egress = [ 
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
   ]
    ingress = [
        {
    cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
        }
    ]
}

resource "aws_key_pair" "deployer" {
    key_name = "aws_key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLAqjmcEEqqpYautpYeN0SsxLRwXpcLVN5F5Q1oL2ec/oLabE4IkVm05iD384kXiT7Ptr3Ri+bxiuwyY8F4dqyMXCPgz3r7BlJfD6635FVSTEsilfWR5+tOU/LQAKKBLLztw6T11jzdtKSp03KJnmPeK4YWd4KUtPQa6eihYfDxuw1LiCYoYYBHtsHV9dF4ZWM1V2WxGJzDXIyRaK3rjKZ18CXREU9xKlNFSQCg1sM9iqT+vOmHjgnrxAI+/z0HDI9nVVxNuU+D1E34pRzfBzG02LNd7LXNhEecqUZGjC31+p6EBX/pYJsMgWlE7UACZ3xCCvu2wyoxBvbba8ZtSqH ajitesh@LAP-0303"
  
}