resource "aws_eks_cluster" "example" {
  name     = "example-cluster"
  role_arn = aws_iam_role.example.arn
  version  = "1.20"
  vpc_config {
    security_group_ids = [aws_security_group.example.id]
    subnet_ids         = [aws_subnet.example.*.id]
  }
}
resource "aws_iam_role" "example" {
  name               = "example-role"
  assume_role_policy = <<EOF
    {
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
        "Service": "eks.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
    }
EOF
}
resource "aws_iam_role_policy" "example" {
  name   = "example-policy"
  role   = aws_iam_role.example.id
  policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Action": [
"ec2:Describe*",
"iam:PassRole",
"eks:"
],
"Resource": ""
}
]
}
EOF
}
resource "aws_security_group" "example" {
  name        = "example-security-group"
  description = "Controls access to the EKS cluster"
}
resource "aws_subnet" "example" {
  count                   = 2
  vpc_id                  = aws_vpc.example.id
  cidr_block              = "10.0.${count.index}.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true
}