output "security_group_id" {
    description = "ID of the Faster Payments MGS security group"
    value       = aws_security_group.faster_payments_mgs.id
}
