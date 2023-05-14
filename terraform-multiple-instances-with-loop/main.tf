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
  count         = var.numberOfInstance
  ami           = var.ami_instance
  instance_type = var.ami_instance_type
  tags = {
    Name = "Server${count.index}"
  }


}
