
/*
 *
 * @desc: VPC resource
 *
 */
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    tags = {
        Name        = "${var.environment}-vpc"
        Environment = var.environment
    }
}

/*
 *
 * @desc: security group for faster payments mgs server
 *
 */
resource "aws_security_group" "faster_payments_mgs" {
    name        = "gy-fp-mgs-t1-sg"
    description = "Allow inbound traffic on BOG Faster Payments STG Environment"
    vpc_id      = aws_vpc.main.id

    # inbound rule: allow TCP 7297
    ingress {
        description = "TCP 7297 from FP-APP-T1 and FP-WEB-T1"
        from_port   = 7297
        to_port     = 7297
        protocol    = "tcp"
        cidr_blocks = [
            "172.27.98.94/32",  # GY-FP-APP-T1
            "172.27.98.11/32"   # GY-FP-WEB-T1
        ]
    }

    # outbound rule: allow all outbound traffic
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "${var.environment}-GY-FP-MGS-T1-SG"
        Environment = var.environment
        Application = "Faster Payments"
    }
}