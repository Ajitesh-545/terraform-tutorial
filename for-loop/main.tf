provider "aws" {
  region = "us-west-2"
}
resource "aws_iam_user" "username" {
    for_each = {for user, name in var.user_list : user => name}
    name = each.value
}
output "print_usernames" {
  value = [for name in var.user_list : name]
}

variable "user_list" {
    description = "This is a list of IAM users"
    type = list(string)
    default = [ "user1","user2","user3" ]
}