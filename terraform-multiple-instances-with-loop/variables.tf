variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"

}

variable "ec2_name" {
  description = "This is name of EC2 instance"
  type        = string
  default     = "MyFirstEc2"

}

variable "configuration" {
  description = "This is where we define array of instances"
  default = [
    {
      "ec2_name" : "MyFirstEc2",
      "ami" : "ami-0578f2b35d0328762",
      "instance_type" = "t2.micro"
    },
    {
      "ec2_name" : "MySecondEc2",
      "ami" : "ami-0578f2b35d0328762",
      "instance_type" = "t2.micro"
    }
  ]
}

variable "ami_instance" {
  description = "This is Amazon Linux instance"
  type        = string
  default     = "ami-0578f2b35d0328762"
}

variable "ami_instance_type" {
  description = "This is instance type"
  type        = string
  default     = "t2.micro"
}

variable "numberOfInstance" {
  description = "How many instances will be created"
  type        = number
  default     = 2
}