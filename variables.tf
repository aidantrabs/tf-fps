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

# loaded from terraform.tfvars (sensitive)
variable "allowed_cidr_blocks" {
    type        = list(string)
    description = "List of CIDR blocks allowed to access Faster Payments MGS"
    sensitive   = true
}

variable "fp_app_port" {
    type        = number
    description = "Port for Faster Payments application"
    default     = 7297
}
