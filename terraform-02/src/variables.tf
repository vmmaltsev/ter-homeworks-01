variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

##variable "vms_ssh_root_key" {
  ##type        = string
  ##default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKV/BNDloDr/oUm/uvv+9BteRDdp4nVdUNh9yIjrLRVs root@debian-s-2vcpu-2gb-fra1-01"
  ##description = "ssh-keygen -t ed25519"
##}

variable "vms_resources" {
  description = "Map of all VM resources"
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
}

variable "metadata" {
  description = "Metadata to be applied to all VMs"
  type = map(string)
  default = {
    "serial-port-enable" = "1"
    "ssh-keys"           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKV/BNDloDr/oUm/uvv+9BteRDdp4nVdUNh9yIjrLRVs root@debian-s-2vcpu-2gb-fra1-01"
  }
}


variable "vm_web_name" {
  type    = string
  default = "web"
}

variable "vm_db_name" {
  type    = string
  default = "db"
}

variable "project_name" {
  type    = string
  default = "netology"
}

variable "platform_name" {
  type    = string
  default = "develop-platform"
}
