resource "docker_network" "example" {
  name   = "example-network"
  driver = "bridge"
}