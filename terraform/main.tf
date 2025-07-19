provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "infravista_repo" {
  name = "infravista-backend"
}

resource "aws_iam_role" "apprunner_role" {
  name = "infravista-apprunner-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "build.apprunner.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "apprunner_attach" {
  role       = aws_iam_role.apprunner_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}

resource "aws_apprunner_service" "infravista_service" {
  service_name = "infravista-backend"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_role.arn
    }

    image_repository {
      image_identifier      = "${aws_ecr_repository.infravista_repo.repository_url}:latest"
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
  value = aws_apprunner_service.infravista_service.service_url
  description = "Public URL of the InfraVista backend"
}
