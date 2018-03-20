Now let's see how to deploy our war file into a docker container.


For the deployment to Docker, we’re going to add a new stage as always. But we’ll do a couple of things differently up front in our stage.

We’ll pull down the input files for Docker to use in building the images from a Git repository on the system.
We’ll run the processes on a different node so we don’t overwrite the workspace we already have on worker_node1.
We want to deploy the latest artifact (war file) into the container that we are spinning up. So we can use the unstash command on the stash that we created at the end of the Retrieve Latest Artifact stage.

To handle this, start out by adding the following lines in bold to your pipeline. (These go after the Retrieve Latest Artifact stage and before the ending bracket.)
 
 

The remaining steps in this process use a combination of shell commands driving Docker and the built-in Docker variable to

Clean out any old images and containers
Build images from Dockerfiles in our git repository. There are two images – one for the webapp (which pulls in the war) and one for the database piece.
Start up and link together containers for each image. This results in our app running under Docker.
Find (inspect) the container to get the ip address where it is running and display that so we can look at it.

The following lines in bold need to be added to the stage to complete it. But for simplicity and avoiding typos, it is recommended you copy and paste them from the file named Docker on the desktop. Either way add these lines in the Deploy to Docker stage .

stage('Deploy To Docker') { node ('worker_node3') {
git 'git@diyvb2:/home/git/repositories/roarv2-docker.git' unstash 'latest-warfile'

sh "docker stop `docker ps -a --format '{{.Names}} \n\n'` || true" sh "docker rm -f `docker ps -a --format '{{.Names}} \n\n'` || true"
sh "docker rmi -f \$(docker images | cut -d' ' -f1 | grep roar) || true"

def dbImage = docker.build("roar-db-image", "-f Dockerfile_roar_db_image .") def webImage = docker.build("roar-web-image", "--build-arg warFile=web*.war -f
Dockerfile_roar_web_image .")

def dbContainer = dbImage.run("-p 3308:3306 -e MYSQL_DATABASE='registry' -e MYSQL_ROOT_PASSWORD='root+1' -e MYSQL_USER='admin' -e MYSQL_PASSWORD='admin'")
def webContainer = webImage.run("--link ${dbContainer.id}:mysql -p 8089:8080")

sh "docker inspect --format '{{.Name}} is available at http://{{.NetworkSettings.IPAddress }}:8080/roar'
\$(docker ps -q -l)"
}
 
}
 
Save your changes and Build with Parameters. Once completed, you will have another stage in your pipeline.



Now, open the Console log for the last build of pipe1. Scroll down near the bottom of the console log and you should see the output of the Docker inspect command. It will look something like the figure below.

Click on the link after “is available at”. This is a link to our webapp running in the Docker container. The ip address/url is on the Docker container. Once you click on that you should see the webapp as its being run in Docker.

