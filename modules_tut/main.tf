provider "aws" {
    region = "us-west-2"
}


module "webserver-1" {
    source = ".//module-1"
}

module "server-2" {
  source = ".//module-2"
}