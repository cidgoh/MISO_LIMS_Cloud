variable "instance_name" {
  default = "miso"
}

variable "image" {
  default = "22209ed8-554e-4b8f-a0d9-4074a62228ee"
}

variable "flavor" {
  default = "15d3461e-c984-4b2c-9197-039c2ff45c54"
}
variable "volume_size" {
  default = 50
}

variable "ssh_key_file_pub" {
  default = "~/.ssh/id_rsa.pub"
}

variable "ssh_key_file_private" {
  default = "~/.ssh/id_rsa"
}

variable "ssh_user_name" {
  default = "ubuntu"
}

variable "pool" {
  default = "Public-Network"
}

variable "network" {
  default = "rrg-whsiao-network"
}
