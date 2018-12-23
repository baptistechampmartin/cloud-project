provider "scaleway" {
  organization = "84f9fd9a-2c31-4b64-a694-3b0124e81767"
  token        = "ef782043-5699-4607-8e83-491058aacc47"
  region = "par1"
}

data "scaleway_image" "projet-tdo" {
  architecture = "x86_64"
  name = "Ubuntu Xenial"
}

resource "scaleway_server" "projet-tdo" {
  name                = "projet-tdo"
  image               = "${data.scaleway_image.projet-tdo.id}"
  type                = "START1-S"
  state               = "running"
  enable_ipv6         = true
  dynamic_ip_required = true
}

data "template_file" "cloud_init_script" {
  template = "${file("cloud-init.yml")}"

  vars {
    msg = "Hello"
  }
}

resource "scaleway_user_data" "cloud-init" {
  server = "${scaleway_server.projet-tdo.id}"
  key    = "cloud-init"
  value  = "${data.template_file.cloud_init_script.rendered}"
}

output "ipv4" {
  value = "${scaleway_server.projet-tdo.public_ip}"
}
