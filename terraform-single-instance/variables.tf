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

variable "aws_access_key" {
  description = "This is to set AWS ACCESS_KEY_ID"
  type        = string
  default     = "AKIA446HKZ3JIKOU33LR"
}

variable "aws_secret_access_key" {
  description = "This is where to set AWS SECRET ACCESS KEY"
  type        = string
  default     = "jpN+zb/qFQZ/K9FAWcgVtg0/ze0CuEsXI3Z12mUs"

}