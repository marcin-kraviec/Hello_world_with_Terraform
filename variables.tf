variable "image" {
    description = "Image of the docker container"
    type = string
    default = "hello-world-app:latest"
}

variable "name" {
    description = "Name for the docker container"
    type = string
    default = "container"
}

variable "external_port" {
    description = "Host machine port"
    type = number
    default = 8080
}

variable "ip_address" {
    description = "IP address "
    type = string
    default = "127.0.0.1"
}

variable "container_path" {
    description = "Container directory in which we would store resources"
    type = string
    default = "/usr/share/nginx/html/"
}

variable "host_path" {
    description = "Host path where resources are stored"
    type = string
}