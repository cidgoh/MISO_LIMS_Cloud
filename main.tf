terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

provider "openstack" {

}

resource "openstack_compute_keypair_v2" "my-cloud-key" {
  name       = "dj-key1"
  public_key = "${file("${var.ssh_key_file_pub}")}"
}




resource "openstack_compute_instance_v2" "lims_test" {
  name = "lims_test"
  flavor_id = "${var.flavor}"
  key_pair = "${openstack_compute_keypair_v2.my-cloud-key.name}"
  security_groups = ["${openstack_compute_secgroup_v2.secgroup_1.name}"]

  network {
    name = "${var.network}"
  }

  block_device {
    uuid = "${var.image}"
    source_type = "image"
    destination_type = "volume"
    volume_size = "${var.volume_size}"
    boot_index = 0
    delete_on_termination = true
  }
}

resource "openstack_networking_floatingip_v2" "myvm_fip" {
  pool = "${var.pool}"
}

resource "openstack_compute_floatingip_associate_v2" "myvm_fip" {
  floating_ip = openstack_networking_floatingip_v2.myvm_fip.address
  instance_id = openstack_compute_instance_v2.lims_test.id
  connection {
    type        = "ssh"
    host        = "${openstack_networking_floatingip_v2.myvm_fip.address}"
    user        = "${var.ssh_user_name}"
    private_key = "${file(var.ssh_key_file_private)}"
  }

  provisioner "local-exec" {
    command = "echo ${openstack_networking_floatingip_v2.myvm_fip.address} > instance_ip.txt"    
  }

  provisioner "file" {
    source      = "./install_docker.sh"
    destination = "install_docker.sh"
  }
  # Install docker
  provisioner "remote-exec" {
    inline = [
      "chmod +x install_docker.sh",
      "./install_docker.sh",
    ]
  }

  provisioner "file" {
    source      = "./install_miso.sh"
    destination = "install_miso.sh"
  }
  # Install miso
  provisioner "remote-exec" {
    inline = [
      "chmod +x install_miso.sh",
      "./install_miso.sh",
    ]
  }
}