provider "aws" {
    region = "us-west-2"
} 

resource "aws_iam_user" "username" {
    count = length(var.user_list)
    name = var.user_list[count.index]
}

variable "user_list" {
  description = "This the list of all the usernames"
  type = list(string)
  default = [ "user1","user2","user3" ]
}