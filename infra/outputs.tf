output "vm_external_ip" {
  description = "Публичный IP виртуальной машины"
  value       = yandex_compute_instance.kittygram.network_interface[0].nat_ip_address
}

output "kittygram_url" {
  description = "Готовая ссылка для tests.yml"
  value       = "http://${yandex_compute_instance.kittygram.network_interface[0].nat_ip_address}:${var.gateway_port}"
}
