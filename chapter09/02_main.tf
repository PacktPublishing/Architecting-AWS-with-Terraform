resource "docker_image" "example" {
  name = "example-image"
  build {
    context    = "./example-image"
    dockerfile = "Dockerfile"
  }
}