resource "aws_ecs_task_definition" "example" {
  family                = "example-task-definition"
  container_definitions = <<DEFINITION
    [
        {
        "name": "example-container",
        "image": "example-image:latest",
        "portMappings": [
            {
            "containerPort": 80,
            "hostPort": 80
            }
        ],
        "memory": 512,
        "cpu": 256
        }
    ]
DEFINITION
}
resource "aws_ecs_service" "example" {
  name            = "example-service"
  task_definition = aws_ecs_task_definition.example.arn
  cluster         = aws_ecs_cluster.example.id
  desired_count   = 2
}
resource "aws_ecs_cluster" "example" {
  name = "example-cluster"
}