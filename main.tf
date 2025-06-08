provider "aws" {
  region     = var.region
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "non-prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

module "network" {
  source = "./modules/vpc"

  name                 = var.env
  vpc_cidr             = "10.0.0.0/16"
  azs                  = ["us-east-1a", "us-east-1b"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
}

module "ecs_fargate_cluster" {
  source             = "./modules/ecs_fargate_cluster"
  cluster_id         = module.ecs_fargate_cluster.cluster_id
  cluster_name       = var.cluster_name
  service_name       = "nginx-service"
  execution_role_arn = module.ecs_fargate_cluster.task_execution_role_arn
  task_role_arn      = module.ecs_fargate_cluster.task_role_arn
  subnet_ids         = module.network.private_subnets
  security_group_ids = var.ecs_sg

  desired_count    = 2
  min_capacity     = 2
  max_capacity     = 5
  cpu_target_value = 50

  tags = var.tags

  enable_custom_metric_policy = true
  custom_metric_name          = "RequestCount"
  custom_metric_namespace     = "MyApp/Metrics"
  custom_metric_target_value  = 100
  custom_metric_dimensions = [
    {
      name  = "ServiceName"
      value = "nginx-service"
    }
  ]
}

module "rds" {
  source             = "./modules/rds_postgres"
  name               = "${var.env}-rds"
  subnet_ids         = module.network.private_subnets
  security_group_ids = var.db_sg
  db_name            = "appdb"
  db_username        = "postgres"
  db_password        = var.db_password
  tags               = var.tags
}

module "redis" {
  source             = "./modules/elasticache"
  name               = "${var.env}-redis"
  subnet_ids         = module.network.private_subnets
  security_group_ids = var.redis_sg
  tags               = var.tags
}

module "static_assets" {
  source      = "./modules/s3"
  bucket_name = "my-static-assets-${var.env}-bucket"
  tags        = var.tags
}