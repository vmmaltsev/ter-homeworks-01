output "vm_ips" {
  value = {
    "${yandex_compute_instance.platform.name}" = yandex_compute_instance.platform.network_interface[0].nat_ip_address
    "${yandex_compute_instance.db.name}" = yandex_compute_instance.db.network_interface[0].nat_ip_address
  }
  description = "The external IP address of the VM instances."
}