variable "vpc_name" {
  description = "nombre de la vpc"
  type        = string
  default     = "vpc-terraform-entregable"
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Zonas de disponibilidad de la VPC"
  type        = list(string)
  default     = ["us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  description = "Subredes privadas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  description = "Subredes públicas"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "enable_nat_gateway" {
  description = "Habilitar el Nat Gateway"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Habilitar el Vpn Gateway"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Etiquetas para la VPC"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

