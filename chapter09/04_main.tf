provider "aws" {
  region = "us-west-2"
}
resource "aws_ecr_repository" "example" {
  name = "example-repository"
}

resource "aws_ecr_lifecycle_policy" "example" {
  repository = aws_ecr_repository.example.name
  policy     = <<EOF
                {
                    "rules": [
                            {
                            "rulePriority": 1,
                            "description": "Expire images older than 30 days",
                            "selection": {
                            "tagStatus": "untagged",
                            "countType": "sinceImagePushed",
                            "countUnit": "days",
                            "countNumber": 30
                            },
                            "action": {
                            "type": "expire"
                            }
                        }
                    ]
                }
            EOF
}