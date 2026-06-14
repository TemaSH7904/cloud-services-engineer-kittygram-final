# S3-бакет приложения в Object Storage (отдельный от state-бакета)
resource "yandex_storage_bucket" "kittygram" {
  access_key = var.access_key
  secret_key = var.secret_key
  bucket     = var.bucket_name
}
