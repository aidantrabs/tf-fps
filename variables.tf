variable "aws_region" {
    type        = string
    description = "AWS region"
    default     = "us-east-1"
}

variable "vpc_cidr" {
    type        = string
    description = "VPC CIDR block"
    default     = "10.0.0.0/16"
}

variable "environment" {
    type        = string
    description = "Environment name"
    default     = "dev"
}
