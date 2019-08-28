
# creating the first resource with terraform 


resource "docker_image" "image_id" {
  name = "ghost:latest"
}


# using the interpolation syntax in terraform

resource "docker_container" "container_id" {
  name = "blog"
  image = "${docker_image.image_id.latest}"
  ports {
    internal = "2386"
    external = "8090"
}
}

# output name and ip address


output "IP_Address" {
  value = "${docker_container.container_id.ip_address}"

}

output "container_name" {
  value = "${docker_container.container_id.name}"
}
