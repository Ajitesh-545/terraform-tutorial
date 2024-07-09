terraform {
  required_version = ">=0.12"
}

resource "aws_instance" "ec2_example" {
  ami = var.ami_id
  instance_type = var.webserver_type
  key_name = "aws_key"
  vpc_security_group_ids = [ aws_security_group.main.id ]
  user_data = <<EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module-2 at instance id `curl http://localhost/latest/meta-data/instance-id` </h1></body></html>" > /var/www/html/index.html


  EOF
}

resource "aws_security_group" "main" {
    name = "SG-WEBSERVER-2"
    description = "This is the security group for webserver 2"
    ingress{
            to_port = 22
            from_port = 22
            protocol = "TCP"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
    ingress{
            to_port = 80
            from_port = 80
            protocol = "TCP"
            cidr_blocks = [ "0.0.0.0/0" ]
        }
     
     egress{
       to_port = 0
       from_port = 0
       protocol = "-1"
       cidr_blocks = [ "0.0.0.0/0" ]
     }
}

resource "aws_key_pair" "deployer2" {
    key_name = "aws_key2"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLAqjmcEEqqpYautpYeN0SsxLRwXpcLVN5F5Q1oL2ec/oLabE4IkVm05iD384kXiT7Ptr3Ri+bxiuwyY8F4dqyMXCPgz3r7BlJfD6635FVSTEsilfWR5+tOU/LQAKKBLLztw6T11jzdtKSp03KJnmPeK4YWd4KUtPQa6eihYfDxuw1LiCYoYYBHtsHV9dF4ZWM1V2WxGJzDXIyRaK3rjKZ18CXREU9xKlNFSQCg1sM9iqT+vOmHjgnrxAI+/z0HDI9nVVxNuU+D1E34pRzfBzG02LNd7LXNhEecqUZGjC31+p6EBX/pYJsMgWlE7UACZ3xCCvu2wyoxBvbba8ZtSqH ajitesh@LAP-0303"
  
}