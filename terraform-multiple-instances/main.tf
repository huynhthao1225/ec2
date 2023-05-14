terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = var.aws_region  
}
/**
* This is where we use for_each loop to create number of list instance in "configuration" variable
**/
resource "aws_instance" "app_server" {

  for_each      = { for server in var.configuration : server.ec2_name => server }
  ami           = each.value.ami
  instance_type = each.value.instance_type
  tags = {
    Name = each.value.ec2_name
  }


}
