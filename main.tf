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
    name = "Container"
    restart = "always"
    ports {
        internal = 80
        external = var.external_port
        ip = var.ip_address
    }
    volumes {
        container_path = "/usr/share/nginx/html/"
        # host_path should be replaced with the location of the folder with a project on the host machine
        host_path = "C:\\Users\\Marcin\\Projects\\VirtusLab"
        read_only = true
    }  
}