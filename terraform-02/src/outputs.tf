output "vm_ips" {
  value = {
    "${local.vm_web_name_local}" = yandex_compute_instance.platform.network_interface[0].nat_ip_address
    "${local.vm_db_name_local}" = yandex_compute_instance.db.network_interface[0].nat_ip_address
  }
  description = "The external IP address of the VM instances."
}