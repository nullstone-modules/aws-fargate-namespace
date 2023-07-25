data "ns_connection" "cluster" {
  name     = "cluster"
  contract = "cluster/aws/ecs:fargate"
}

resource "aws_ecs_cluster" "namespace" {
  name = local.resource_name
  tags = local.tags

  // TODO: Enable execute command with encryption configured on logging

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "namespace" {
  cluster_name       = aws_ecs_cluster.namespace.name
  capacity_providers = ["FARGATE"]
}
