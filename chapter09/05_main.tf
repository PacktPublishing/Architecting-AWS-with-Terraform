resource "aws_ecr_image" "example" {
  repository   = aws_ecr_repository.example.name
  image_tag    = "latest"
  image_digest = data.aws_ecr_image.example.image_digest
}
data "aws_ecr_image" "example" {
  repository_name = aws_ecr_repository.example.name
  image_tag       = "latest"
}