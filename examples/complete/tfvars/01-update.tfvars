#alicloud_eip
eip_bandwidth = 15

#alicloud_slb_load_balancer
name          = "update-tf-eip-slb-ecs-redis-rds-name"
slb_spec      = "slb.s2.medium"
slb_tags_info = "update_slb_tags_info"

#alicloud_instance
system_disk_name           = "test_system_disk"
system_disk_description    = "test_system_disk_description"
internet_max_bandwidth_out = "20"

#alicloud_kvstore_instance
redis_instance_name  = "update-tf-redis-name"
security_ips         = ["10.23.12.24"]
redis_engine_version = "5.0"

#alicloud_db_instance
instance_storage  = "50"
monitoring_period = "5"