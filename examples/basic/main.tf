module "security_group" {
  source = "../.."

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
    Project     = "strategy3-demo"
  }
}
