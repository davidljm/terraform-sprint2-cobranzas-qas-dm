variable "ami_id" {
  description = "ID de la AMI"
  type        = string
  default     = "ami-0a3c3a20c09d6f377"
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
  default     = "t2.micro"
}

variable "associate_public_ip_address" {
  description = "Asociar dirección IP pública"
  type        = bool
  default     = true
}

variable "instance_tags" {
  description = "Etiquetas para la instancia EC2"
  type        = map(string)
  default     = {
    Name = "ORG-COBRANZAS-QAS" # Reemplazar por el nombre correspondiente
  }
}

