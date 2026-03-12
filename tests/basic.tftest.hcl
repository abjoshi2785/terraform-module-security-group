mock_provider "aws" {}

variables {
  name   = "demo-sg"
  vpc_id = "vpc-12345678"

  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_ipv4   = "10.0.0.0/16"
      description = "SSH internal"
    }
  ]

  tags = {
    Environment = "dev"
  }
}

run "plan_security_group" {
  command = plan

  assert {
    condition     = aws_security_group.this.name == "demo-sg"
    error_message = "Security group name was not set correctly."
  }

  assert {
    condition     = aws_security_group.this.vpc_id == "vpc-12345678"
    error_message = "VPC ID was not set correctly."
  }

  assert {
    condition     = length(aws_vpc_security_group_ingress_rule.this) == 1
    error_message = "Expected exactly one ingress rule."
  }

  assert {
    condition     = output.module_version == "1.0.0"
    error_message = "Module version output does not match expected version."
  }
}
