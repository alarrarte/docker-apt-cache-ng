# docker-apt-cache-ng

# Using Dockerfile

The Dockerfile template creates a Docker image for your application that:

* Uses the Ubuntu 18.04 image
* Runs apt-cacher-ng application inside the container
* Application will run on port 3142 inside the container
* Cache directory will be located at a volume -> /var/cache/apt-cacher-ng

# Building the Docker image for your application

docker build -t apt-cacher-ng -f Dockerfile .

where `apt-cacher-ng` is the name you want to give your created Docker image.

# Running the Docker image for your application

After the Docker image has been created for your application, you can run it using either of the following commands:

* Run as an interactive application on your command line:
```sh
docker run -i -p 8080:3142 -t apt-cacher-ng
```

This maps port 3142 in the Docker image to port 8080 on your machine. If you are using a different port, you will need to change the mapping.

Run as a daemon process:

```sh
docker run -d -p 8080:3142 -t apt-cacher-ng
```

This uses the -d flag rather than the -i flag to run the Docker image as a background task.






# Publishing the Image

In order to use your application's Docker image in a cloud it needs to be published. You can deploy to the image to the DockerHub registry using the following commands:

Log in to DockerHub:

```sh
docker login
```

This logs you into DockerHub using your Docker ID, where you have a namespace that matches your DockerHub ID.

Tag your application's Docker image with the name you want to use in DockerHub:

```sh
docker tag apt-cacher-ng <namespace>/apt-cacher-ng:1.0.0
```

where <namespace> is your namespace in DockerHub.

Publish your application's Docker image to DockerHub:

```sh
docker push <namespace>/apt-cacher-ng:1.0.0
```

where <namespace> is your namespace in DockerHub.
