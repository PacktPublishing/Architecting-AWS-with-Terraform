module "web_server_cluster" {
  source          = "./web_server_cluster"
  num_web_servers = 3
  web_server_size = "t2.micro"
  database_size   = "t2.micro"
}