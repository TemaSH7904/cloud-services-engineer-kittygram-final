# --- Аутентификация и расположение ---
variable "cloud_id" {
  description = "ID облака Yandex Cloud (yc config list)"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud (yc config list)"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "yc_sa_key_file" {
  description = "Путь к authorized_key.json сервисного аккаунта"
  type        = string
  default     = "authorized_key.json"
}

# --- Ключи для Object Storage (S3) ---
variable "access_key" {
  description = "Static access key ID сервисного аккаунта (для бакета)"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Static secret key сервисного аккаунта (для бакета)"
  type        = string
  sensitive   = true
}

# --- Бакет приложения ---
variable "bucket_name" {
  description = "Имя S3-бакета приложения. Глобально уникальное и ОТЛИЧНОЕ от state-бакета"
  type        = string
}

# --- Доступ на ВМ ---
variable "ssh_public_key" {
  description = "Содержимое публичного SSH-ключа (cat ~/.ssh/id_ed25519.pub)"
  type        = string
}

variable "vm_user" {
  description = "Пользователь на ВМ для SSH и Docker"
  type        = string
  default     = "ubuntu"
}

# --- Сетевые порты ---
variable "gateway_port" {
  description = "Порт сервиса gateway (HTTP)"
  type        = number
  default     = 9000
}

# --- Параметры ВМ (минимальные, ради экономии гранта) ---
variable "vm_cores" {
  description = "Количество ядер vCPU"
  type        = number
  default     = 2
}

variable "vm_memory" {
  description = "Объём RAM в ГБ"
  type        = number
  default     = 2
}

variable "vm_core_fraction" {
  description = "Гарантированная доля vCPU, % (5/20/50/100)"
  type        = number
  default     = 20
}

variable "vm_disk_size" {
  description = "Размер загрузочного диска, ГБ"
  type        = number
  default     = 15
}

variable "vm_preemptible" {
  description = "Прерываемая (preemptible) ВМ: дешевле, но Yandex может остановить. На финальную проверку ставьте false"
  type        = bool
  default     = false
}
