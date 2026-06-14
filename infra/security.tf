resource "yandex_vpc_security_group" "kittygram" {
  name        = "kittygram-sg"
  description = "Доступ к ВМ Kittygram: SSH и gateway, весь исходящий трафик"
  network_id  = yandex_vpc_network.kittygram.id

  # Весь исходящий трафик разрешён
  egress {
    protocol       = "ANY"
    description    = "Allow all outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  # Входящий трафик: только SSH
  ingress {
    protocol       = "TCP"
    description    = "SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  # Входящий трафик: только gateway (HTTP)
  ingress {
    protocol       = "TCP"
    description    = "Gateway HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = var.gateway_port
  }
}
