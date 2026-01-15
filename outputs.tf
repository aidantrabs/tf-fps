output "vpc_id" {
    description = "ID of the VPC"
    value       = module.vpc.vpc_id
}

output "security_group_id" {
    description = "ID of the Faster Payments MGS security group"
    value       = module.faster_payments_sg.security_group_id
}
