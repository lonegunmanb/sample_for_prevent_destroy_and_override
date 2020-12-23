provider "ucloud" {
  public_key  = var.public_key
  private_key = var.private_key
  project_id  = var.project_id
  region      = var.region
}

data "ucloud_images" "centos" {
  name_regex        = "^CentOS 7"
  availability_zone = var.az
}

resource "ucloud_instance" "nosql" {
  availability_zone = var.az
  image_id          = data.ucloud_images.centos.images[0].id
  instance_type     = "n-basic-1"
  charge_type       = "dynamic"
  lifecycle {
    prevent_destroy = true
  }
}
