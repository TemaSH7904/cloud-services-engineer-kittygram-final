data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2404-lts"
}

resource "yandex_compute_instance" "kittygram" {
  name        = "kittygram-vm"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores         = var.vm_cores
    memory        = var.vm_memory
    core_fraction = var.vm_core_fraction
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = var.vm_disk_size
      type     = "network-hdd"
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.kittygram.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.kittygram.id]
  }

  metadata = {
    # cloud-init: установка Docker и Docker Compose
    user-data = templatefile("${path.module}/cloud-init.yaml.tftpl", {
      vm_user = var.vm_user
    })
    # SSH-доступ для деплоя
    ssh-keys = "${var.vm_user}:${var.ssh_public_key}"
  }
}
