1\. Type `docker pull` into our terminal and note the structural syntax to enacting the `pull` command:

Output:

`docker pull [OPTIONS] NAME[:TAG|@DIGEST]`{{execute}}


2\. Now, let’s make our own `pull` request using the appropriate syntax we just learned. The name of the image we want to ```pull``` is ```docker/whalesay```, we don’t need to enact any options, and we won’t need to specify a tag this time.

> **NOTE:** Whenever you don’t issue a specific tag, Docker defaults to latest.

`docker pull docker/whalesay`{{execute}}


> **NOTE:** If you do not have access to the internet, consult your instructor. 

3\. Verify we have successfully pulled our image down using the previous command:

`docker images`{{execute}}
