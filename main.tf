provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/eip-slb-ecs-redis-rds"
}

resource "alicloud_security_group" "default" {
  vpc_id      = var.vpc_id
  name        = var.name
  description = var.description
}

resource "alicloud_eip" "default" {
  bandwidth            = var.eip_bandwidth
  internet_charge_type = var.eip_internet_charge_type
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  address_type       = var.slb_address_type
  load_balancer_spec = var.slb_spec
  vswitch_id         = var.vswitch_id
  tags               = {
    info = var.slb_tags_info
  }
}

resource "alicloud_instance" "default" {
  availability_zone          = var.zone_id
  instance_name              = var.name
  security_groups            = alicloud_security_group.default.*.id
  vswitch_id                 = var.vswitch_id
  instance_type              = var.instance_type
  system_disk_category       = var.system_disk_category
  system_disk_name           = var.system_disk_name
  system_disk_description    = var.system_disk_description
  image_id                   = var.image_id
  internet_max_bandwidth_out = var.internet_max_bandwidth_out
  data_disks {
    name        = var.name
    size        = var.ecs_size
    category    = var.category
    description = var.description
    encrypted   = true
  }
}

resource "alicloud_kvstore_instance" "default" {
  db_instance_name      = var.redis_instance_name
  vswitch_id            =  var.vswitch_id
  security_ips          = var.security_ips
  instance_type         = var.redis_instance_type
  engine_version        = var.redis_engine_version
  zone_id               = var.zone_id
  instance_class        = var.redis_instance_class
}

resource "alicloud_db_instance" "default" {
  instance_name        = var.name
  vswitch_id           = var.vswitch_id
  engine               = var.engine
  engine_version       = var.engine_version
  instance_type        = var.rds_instance_type
  instance_storage     = var.instance_storage
  instance_charge_type = var.instance_charge_type
  monitoring_period    = var.monitoring_period
}