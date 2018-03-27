### Build

We now have a configured job that will build Docker Images based on our Git repository. The next stage is to test and try it.

#### Task: Build Now

On the left-hand side, select **Build Now**. 

>Note: You should see a build scheduled with a (confusing) message "(pending—Jenkins doesn’t have label docker-agent)".

In the background, Jenkins is launching the container and connecting to it via SSH. Sometimes this can take a moment or two.

Go back to Terminal. You can watch the progress using `docker logs --tail=10 jenkins`{{execute}}

As the Jenkins slave is a container, you can view it using the Docker CLI tools `docker ps -a`{{execute}}

It's normal for this to take a few moments to complete.
