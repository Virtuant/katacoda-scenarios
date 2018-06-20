The Dockerfile is used by the Docker CLI build command. The build command executes each instruction within the Dockerfile. 
The result is a built Docker Image that can be launched and run your configured app.

The build command takes in some different parameters. The format is 

`docker build -t <build-directory>`

The -t parameter allows you to specify a friendly name for the image and a tag, commonly used as a version number. 
This allows you to track built images and be confident about which version is being started.

Build our static HTML image using the build command below.

`docker build -t webserver-image:v1 .`{{execute T1}}

You can view a list of all the images on the host using 

`docker images`{{execute T1}}

The built image will have the name webserver-image with a tag of v1.