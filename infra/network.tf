resource "yandex_vpc_network" "kittygram" {
  name = "kittygram-network"
}

resource "yandex_vpc_subnet" "kittygram" {
  name           = "kittygram-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.kittygram.id
  v4_cidr_blocks = ["10.0.0.0/24"]
}
