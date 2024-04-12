variable "github_token" { }

variable "github_owner" {
  description = "Propietario del repositorio en GitHub"
  type        = string
  default     = "alkemytech" # nombre de tu usuario de github
}

variable "github_repository" {
  description = "Nombre del repositorio en GitHub"
  type        = string
  default     = "UMSA-DevOps-T4" # nombre de tu repo de github
}

variable "ssh_private_key_secret_name" {
  description = "Nombre del secreto para la clave SSH en GitHub"
  type        = string
  default     = "SSH_PRIVATE_KEY_COBRANZAS"
}

variable "host_secret_name" {
  description = "Nombre del secreto para el host en GitHub"
  type        = string
  default     = "HOST_COBRANZAS"
}
