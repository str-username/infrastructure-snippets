resource "yandex_vpc_network" "this" {
  name        = var.vpc.name
  description = var.vcp.description
  folder_id   = var.vpc.folder_id
  labels      = var.labels
}

resource "yandex_vpc_subnet" "main" {
  for_each       = var.subnets
  network_id     = yandex_vpc_network.this.id
  v4_cidr_blocks = var.subnets.v4_cidr_blocks
  zone           = var.subnets.zone
  name           = var.subnets.name
  description    = var.subnets.description
  folder_id      = var.vpc.folder_id
  labels         = var.labels
  route_table_id = yandex_vpc_route_table.this.id
  dynamic "dhcp_options" {
    for_each = var.vpc.dhcp_options
    content {
      domain_name         = dhcp_options.value.domain
      domain_name_servers = dhcp_options.value.name_servers
      ntp_servers         = dhcp_options.value.ntp_servers
    }
  }
}

resource "yandex_vpc_route_table" "this" {
  network_id  = yandex_vpc_network.this.id
  name        = "${var.vpc.name}-egress-rt"
  description = "Default route that's allowed out traffic from vpc gateway"
  folder_id   = var.vpc.folder_id
  labels      = var.labels

  # Enabled internet access without public ips
  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.this.id
  }
}

resource "yandex_vpc_gateway" "this" {
  name        = "${var.vpc.name}-internet-gw"
  description = "Default internet gateway that's allowed internet access without public ips"
  folder_id   = var.vpc.folder_id
  labels      = var.labels
  shared_egress_gateway {}
}
