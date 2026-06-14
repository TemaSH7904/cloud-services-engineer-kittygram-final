terraform {
  required_version = ">= 1.6"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.95.0"
    }
  }

  # State хранится в ЗАРАНЕЕ созданном бакете S3 (этап подготовки).
  # ВНИМАНИЕ: имя бакета вписывается вручную — backend не поддерживает переменные.
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket = "tema-kittygram-tfstate"
    region = "ru-central1"
    key    = "tf-state.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}

provider "yandex" {
  service_account_key_file = var.yc_sa_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
