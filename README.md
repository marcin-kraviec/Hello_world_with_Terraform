# Running Docker container with Terraform
### Hello world project

This repo provides terraform module for running a basic dockerized application on local machine.
The aim is to run a web app serving a static HTML page that can be found in index.html file.
Very basic Dockerfile was created, that allowed to create an image that can be found [here](https://hub.docker.com/repository/docker/marcinkraviec/hello-world-app)

Terraform module accepts input variables: Docker image, container name, container path, host path, host machine port, ip address.
To check how this basic project works start with cloning this repository by opening a terminal and typing:

    git clone https://github.com/marcin-kraviec/Hello_world_with_Terraform.git

It is important to clone this repo to one of the project directory and to execute all the other steps in this certain directory.

Then the docker image should be created. 
The first option is to use an image provided in a hyperlink above
The second option is to build an image from the Dockerfile provided in this repo by typing:

    docker build -t [image tag] .

for example: 

    docker build -t hello-world-app .

When the image is created terraform module can be set up by typing:

    terraform init

Then the configuration should be checked by typing:

    terraform plan

The host_path is an obligatory variable an you will be asked to provide it

If both operations executed without any problems the module is ready to be run. 

To run the module with default values which are:
    
    image: "hello-world-app:latest"
    
    name: "container"

    container_path: "/usr/share/nginx/html/"
    
    external_port: 8080
    
    ip_address: "127.0.0.1"

The host_path is an obligatory variable
   
type:

    terraform apply

Then provide the host path and then confirm the action by typing 'yes'


Now you can open your web browser and type: 

    localhost:8080 

or 

    127.0.0.1:8080

You should see 'This is a simple Hello world project'.

You can also type:

    docker ps 

in the terminal to see that the container is running.

If you would like to run a module with other values that differ from the default ones you can type:

    terraform apply -var="image=[image name]" 

    terraform apply -var="name=[name]" 

    terraform apply -var="external_port=[port number]"

    terraform apply -var="container_path=[container_path]" 

    terraform apply -var="ip_address=[ip address]"

Here are some examples of running modules with different variables:

    terraform apply -var="image=hello-world-app:1.0"

    terraform apply -var="external_port=6500"

    terraform apply -var="external_port=6500" -var="image=hello-world-app:1.0"

