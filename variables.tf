variable "name" {
  description = "Security group name"
  type        = string
}

variable "description" {
  description = "Security group description"
  type        = string
  default     = "Managed by Terraform/OpenTofu"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_ipv4   = string
    description = optional(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_ipv4   = string
    description = optional(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_ipv4   = "0.0.0.0/0"
      description = "Allow all outbound"
    }
  ]
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
