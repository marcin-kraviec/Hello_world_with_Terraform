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

resource "docker_container" "hello-world-app" {
    image = var.image
    name = "Container"
    restart = "always"
    ports {
        internal = var.internal_port
        external = var.external_port
        ip = var.ip_address
    }
    volumes {
        container_path = "/usr/share/nginx/html/"
        # host_path should be replaced
        host_path = "C:\\Users\\Marcin\\Projects\\VirtusLab"
        read_only = true
    }  
}