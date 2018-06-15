1\. Now, leave the container running in your primary terminal window and preform the following commands in your secondary window, to stop the latter container:

`docker stop <container-id, or name>`{{execute T2}}

> NOTE: The names (--name) we assigned were Bert and Ernie, and we know Ernie is down at this moment. So, Bert is the container name to use.

2\. Start the container back up now and confirm that ```hello.py``` is still available:

`docker start <container-id, or name>`{{execute T2}}

> NOTE: This is when the (```--name```) option flag is best served. You can also use the first 2-4 numbers of the container-id. Docker will pick up on it.

3\. Execute a command inside the container, concerning our `hello.py` file, using the execute (`exec`) command. Before we run our command though, let’s look at the syntax of the (`exec`) command by typing into our terminal `docker exec`. Now, let’s run ours:

`docker exec <container-id, or name> tail /root/hello.py`{{execute T2}}


4\. What if we wanna go back into our contianer? Well, we can use the execute (```exec```) command for that as well, to invoke our bash shell, as follows:

`docker exec -it <container-id, or name> bash`{{execute T2}}

5.\ Then, be sure to exit out of the container by typing `exit`{{copy}} into the appropriate terminal window (Terminal Host 2)