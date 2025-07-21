provider "aws" {
  region = "us-east-1"
}

# Reference existing ECR repo
data "aws_ecr_repository" "infravista" {
  name = "infravista"
}

# Reference existing IAM Role
data "aws_iam_role" "apprunner_role" {
  name = "infravista-apprunner-role"
}

resource "aws_apprunner_service" "infravista_service" {
  service_name = "infravista-backend-v2"

  source_configuration {
    authentication_configuration {
      access_role_arn = data.aws_iam_role.apprunner_role.arn
    }

    image_repository {
      image_identifier      = "${data.aws_ecr_repository.infravista.repository_url}:latest"
      image_repository_type = "ECR"
      image_configuration {
        port = "5000"
      }
    }

    auto_deployments_enabled = true
  }

  instance_configuration {
    cpu    = "1024"
    memory = "2048"
  }
}

output "service_url" {
  value       = aws_apprunner_service.infravista_service.service_url
  description = "Public URL of the InfraVista backend"
}
