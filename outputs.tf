output "this_ecs_id" {
  description = "The ID of the ECS instance."
  value       = alicloud_instance.default.id
}

output "this_rds_id" {
  description = "The ID of the RDS instance."
  value       = alicloud_db_instance.default.id
}

output "this_slb_id" {
  description = "The ID of the SLB instance."
  value       = alicloud_slb_load_balancer.default.id
}

output "this_eip_id" {
  description = "The ID of the EIP instance."
  value       = alicloud_eip.default.id
}

output "this_redis_instance_id" {
  description = "The ID of the Redis instance."
  value       = alicloud_kvstore_instance.default.id
}

output "this_ecs_name" {
  description = "The name of the ECS instance."
  value       = alicloud_instance.default.instance_name
}