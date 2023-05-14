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

resource "aws_instance" "app_server" {
  ami           = "ami-0578f2b35d0328762"
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2_name
  }
}
