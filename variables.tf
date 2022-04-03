variable "image" {
    description = "Image of the docker container"
    type = string
    default = "hello-world-app:latest"
}

variable "external_port" {
    description = "Host machine port"
    type = number
    default = 8081
}

variable "ip_address" {
    description = "IP address "
    type = string
    default = "127.0.0.1"
}