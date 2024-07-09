provider "aws" {
  region = "us-west-2"
}
locals {
    staging_env="staging" 
}

resource "aws_vpc" "staging_vpc" {
  cidr_block = "10.5.0.0/16"
  tags = {
    Name="${local.staging_env}-vpc-tag"
  }
}

resource "aws_subnet" "staging_subnet" {
vpc_id = aws_vpc.staging_vpc.id
cidr_block = "10.5.0.0/16"
tags = {
    Name="${local.staging_env}-subnet-tag"
}
}

resource "aws_instance" "staging_ec2" {
  ami = "ami-00970f57473724c10"
  instance_type = "t2.micro"
  tags = {
    Name="${local.staging_env}-ec2-tag"
  }
}