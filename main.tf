/*
 * 
 * @desc: VPC using public terraform-aws-modules/vpc/aws module
 *
 */
module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "5.17.0"

    name = "${var.environment}-vpc"
    cidr = var.vpc_cidr

    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Environment = var.environment
    }
}

/*
 *
 * @desc: security group using public terraform-aws-modules/security-group/aws module
 *
 */
module "faster_payments_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.2.0"

    name        = "gy-fp-mgs-t1-sg"
    description = "Allow inbound traffic on BOG Faster Payments STG Environment"
    vpc_id      = module.vpc.vpc_id

    ingress_with_cidr_blocks = [
        {
            from_port   = var.fp_app_port
            to_port     = var.fp_app_port
            protocol    = "tcp"
            description = "TCP ${var.fp_app_port} from FP-APP-T1 and FP-WEB-T1"
            cidr_blocks = join(",", var.allowed_cidr_blocks)
        }
    ]

    egress_with_cidr_blocks = [
        {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = "0.0.0.0/0"
            description = "Allow all outbound traffic"
        }
    ]

    tags = {
        Name        = "${var.environment}-GY-FP-MGS-T1-SG"
        Environment = var.environment
        Application = "Faster Payments"
    }
}
