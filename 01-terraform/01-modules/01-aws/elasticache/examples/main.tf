module "cluster_disabled" {
  source                   = "../"
  allowed_access_from_name = "this allowed from"
  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  allowed_cidrs            = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
  cluster_name             = "cache-001"
  multi_az_enabled         = false
  engine_version           = "7.0"
  maintenance_window       = "tue:06:00-tue:07:00"
  node_type                = "cache.t4g.micro"
  num_cache_clusters       = 1
  snapshot_window          = "03:00-04:00"
  subnet_group_name        = data.terraform_remote_state.vpc.outputs.database_subnet_group_name
  tags                     = { Terraform = true }
  cluster_enabled          = false
}

module "cluster_enabled" {
  source                     = "../"
  allowed_access_from_name   = "this allowed from"
  vpc_id                     = data.terraform_remote_state.vpc.outputs.vpc_id
  allowed_cidrs              = ["10.10.10.0/24", "10.10.20.0/24", "10.10.30.0/24"]
  cluster_name               = "cache-002"
  multi_az_enabled           = false
  automatic_failover_enabled = true
  engine_version             = "7.0"
  maintenance_window         = "tue:06:00-tue:07:00"
  node_type                  = "cache.t4g.micro"
  num_node_groups            = 1
  replicas_per_node_group    = 1
  snapshot_window            = "03:00-04:00"
  subnet_group_name          = data.terraform_remote_state.vpc.outputs.database_subnet_group_name
  tags                       = { Terraform = true }
  cluster_enabled            = true
}

