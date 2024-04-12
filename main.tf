terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

# Configuración del proveedor AWS
provider "aws" {
  region = "us-east-1"
}

# Crear una nueva VPC | Uso de Modules https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.6.0"

  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.vpc_azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = var.tags
}

# Crear un nuevo grupo de seguridad
resource "aws_security_group" "instance_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

# Generar una nueva clave SSH  |  https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Crear un par de claves SSH y guardar la clave pública
resource "aws_key_pair" "ec2-server-ssh-key" {
  key_name   = "ec2-server-ssh-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Definición de la instancia EC2
resource "aws_instance" "COBRANZAS_dev_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.instance_security_group.id]
  key_name                    = aws_key_pair.ec2-server-ssh-key.key_name

  associate_public_ip_address = var.associate_public_ip_address

  tags = var.instance_tags
}

# Upload secrets Github 
provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_actions_secret" "ssh_private_key" {
  repository      = var.github_repository
  secret_name     = var.ssh_private_key_secret_name
  plaintext_value = tls_private_key.ssh_key.private_key_pem
}

resource "github_actions_secret" "host" {
  repository      = var.github_repository
  secret_name     = var.host_secret_name
  plaintext_value = aws_instance.COBRANZAS_dev_instance.public_ip
}
