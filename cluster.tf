data "ns_connection" "cluster" {
  name     = "cluster"
  contract = "cluster/aws/ecs:fargate"
}

locals {
  cluster_arn    = local.is_preview_env ? aws_ecs_cluster[0].namespace.arn : data.ns_connection.cluster.outputs.cluster_arn
  cluster_name   = local.is_preview_env ? aws_ecs_cluster[0].namespace.name : data.ns_connection.cluster.outputs.cluster_name
  deployers_name = local.is_preview_env ? aws_iam_group.deployers[0].name : data.ns_connection.cluster.outputs.deployers_name
}

resource "aws_ecs_cluster" "namespace" {
  count = local.is_preview_env ? 1 : 0

  name = local.resource_name
  tags = local.tags

  // TODO: Enable execute command with encryption configured on logging

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "namespace" {
  count = local.is_preview_env ? 1 : 0

  cluster_name       = aws_ecs_cluster.namespace[count.index].name
  capacity_providers = ["FARGATE"]
}
