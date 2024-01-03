resource "docker_container" "example" {
  name  = "example-container"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 8080
  }
  environment {
    EXAMPLE_VAR = "example value"
  }
  volumes {
    container_path = "/var/www/html"
    host_path      = "./data"
    read_only      = true
  }
}