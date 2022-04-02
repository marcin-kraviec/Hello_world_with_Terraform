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
    image = "hello-world-app:latest"
    name = "hello_world_app_container"
    restart = "always"
    ports {
        internal = 80
        external = 8081
    }
    volumes {
        container_path = "/usr/share/nginx/html/"
        # host_path should be replaced
        host_path = "C:\\Users\\Marcin\\Projects\\VirtusLab"
        read_only = true
    }  
}