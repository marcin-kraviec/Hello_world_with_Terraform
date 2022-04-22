terraform{
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "2.16.0"
        }
    }
}
provider "docker" {   
    host    = "npipe:////.//pipe//docker_engine"
}

resource "docker_container" "image" {
    image = var.image
    name = var.name
    restart = "always"
    ports {
        internal = 80
        external = var.external_port
        ip = var.ip_address
    }
    volumes {
        container_path = "/usr/share/nginx/html/"
        host_path = var.host_path
        read_only = true
    }  
}