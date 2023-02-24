data "yandex_client_config" "this" {}

module "vpc" {
  source = "../../vpc"
  vpc = {
    name      = "example-vpc"
    folder_id = data.yandex_client_config.this.folder_id
  }

  subnets = {
    example-1a = {
      zone           = "ru-central-1a"
      name           = "example-subnet-1a"
      v4_cidr_blocks = ["10.10.0.0/16"]
    }
    example-1b = {
      zone           = "ru-central-1b"
      name           = "example-subnet-1b"
      v4_cidr_blocks = ["10.11.0.0/16"]
    }
  }
  labels = {}
}