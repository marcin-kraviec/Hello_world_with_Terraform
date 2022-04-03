# Running Docker container with Terraform
### Hello world project

This repo provides terraform module for running a basic dockerized application on local machine.
The aim is to run a web app serving a static HTML page that can be found in index.html file.
Very basic Dockerfile was created, that allowed to create an image can can be found [here](https://hub.docker.com/repository/docker/marcinkraviec/hello-world-app)

Terraform module accepts input variables: Docker image, host machine port, ip address.
To check how the project works start with cloning this repository by opening a terminal and typing:

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

If both operations executed without any problems the module is ready to be run. 

To run the module with default values which are:
    
    image: "hello-world-app:latest"
    
    external_port: 8081
    
    ip_address: "127.0.0.1" (localhost)

type:

    terraform apply 

and then confirm the action by typing 'yes'

Now you can open your web browser and type: 

    localhost:8081 

or 

    127.0.0.1:8081

You should see 'This is a simple Hello world project'.

You can also type:

    docker ps 

in the terminal to see that the container is running.

If you would like to run a module with other values that differ from the default ones you can type:

    terraform apply -var="image=[image name]" 

    terraform apply -var="external_port=[port number]"

    terraform apply -var="ip_address=[ip address]"

Here are some examples of running modules with different variables:

    terraform apply -var="image=hello-world-app:1.0"

    terraform apply -var="external_port=6500"

    terraform apply -var="external_port=6500" -var="image=hello-world-app:1.0"

There are other containarisation solutions that can be use to build and run cointainers. Hyber-V containers are an example.
Ansible can be considered as other Infrastracture as a Code solusion.
A great advantage od Terraform is that it can work with different cloud providers. It also uses quite simple language - HCL
