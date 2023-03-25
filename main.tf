provider "aws" {
  region = local.region
}
variable "usuarios" {
  description = "Nombre usuarios IAM"
  type        = number
}

locals {
  region = "us-east-2"
}

resource "aws_iam_user" "ejemplo" {
  count = var.usuarios

  name = "usuario-${count.index}"
}

output "arn_usuario" {
  description = "ARN del usuario Maria"
  value       = aws_iam_user.ejemplo[2].arn
}

output "arn_todos_usuarios" {
  description = "ARN todos los usuarios"
  value       = aws_iam_user.ejemplo[*].name
}

/* output "nombre_a_arn" {
  description = "ARN usuario"
  value       = { for usuario in aws_iam_user.ejemplo : usuario.name => usuario.arn }
}

output "nombres_usuarios" {
  value = [for usuario in aws_iam_user.ejemplo : usuario.name]
}
 */
