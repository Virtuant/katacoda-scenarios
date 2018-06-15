If any of our interactive (`-it`) container are still running, close it `CTL+C`. We also need to close any others down and remove all other previously used images from our local repository list so we can start a new project. We can do that by issuing a series or commands, as follows:

1\. Print a list of all currently running and exited containers:

`docker ps -a`{{T1}}

2\. Remove containers from the list, using: 

`docker rm <container-id, or name>`{{T1}}

Because our container is currently active, we’ll need to force (`-f`) the removal process. We could also use the (`kill`) command, before removing, but we’ll use force this time.

`docker rm -f <container-id, or name>`{{T1}}

>NTOE: You don't want to make a practice of deleting all your istances, because it will cost you time. Each image you delete must be downloaded, or built again. This is done for learning purposes only.

3\. Print a list of current local repository images:

`docker images`{{T1}}


Try adding all(`-a`) and then compare the lists together.

4\. Remove images now from local repository of images:

`docker rmi <image-id, or name-type>`{{T1}}

