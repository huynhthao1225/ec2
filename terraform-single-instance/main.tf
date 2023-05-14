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
  region = var.aws_region
}

resource "aws_instance" "app_server" {
  ami                   = "ami-0578f2b35d0328762"
  instance_type         = "t2.micro"
  key_name              = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt"
    ]

  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("/home/thao/.ssh_aws/aws_rsa")
    timeout     = "4m"
  }

  tags = {
    Name = var.ec2_name
  }
}
resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    }
  ]
}
resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCoRq9Qu2SImJ3HkiV/N8B1WU1PKtBWRckfqXu1nerd1N6a3umrQLiZhxwyBVe60pousalspWjOgCuFofWdbIvwjXTjtlbBfp5JkNtqS/4jSJqFWKU216w4+fhAQl8YE0PQw7q/LSRsh4wQQ+y9DgjijrDsuogZ8GoJxjQRQsKY5aAX4FACv8EHglRoiqCbCUTSrS6wgi06qak+5dLoLq9vyXUPWcwu+0HWPco6qKm4RQP2PYBGBR4usHARdNeGOPO+fm2flJmh/PLtNPScD2p4eA75lQxGZWTbPn08MojyOjK+qCHdScptdVeMfl6DUV/Fhz3VEuoMIlHpLo6NLd4f thao@Dell7810"
}

