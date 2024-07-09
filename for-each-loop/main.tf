provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_user" "username" {
  for_each = var.user_list
  name = each.value
}

variable "user_list" {
    description = "This is a list of IAM users"
    type = set(string)
    default = [ "user1","user2","user3" ]
}