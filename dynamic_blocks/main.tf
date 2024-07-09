provider "aws" {
    region = "us-west-2" 
}

locals {
  ingress_rules=[
    {
        port=80
        description="Ingress rule for port 80"
    },
    {
        port=443
        description="Ingress rule for port 443"
    }
  ]
}

resource "aws_security_group" "main" {
    name = "resource with dynamic block"
    dynamic "ingress" {
      for_each = local.ingress_rules

      content {
        description = ingress.value.description
        to_port = ingress.value.port
        from_port = ingress.value.port
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
      }
    }

  
}