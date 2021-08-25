module "tf-eip-slb-ecs-rds" {
  source            = "../"
  name              = "tf-eip-slb-ecs-rds"
  instance_type     = "ecs.n4.large"
  rds_instance_type = "rds.mysql.s2.large"
  slb_address_type  = "intranet"
}
