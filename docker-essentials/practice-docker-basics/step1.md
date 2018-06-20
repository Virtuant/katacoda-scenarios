As we discussed in the last lesson, (“Introduction to Docker Containers”) our containers don’t necessarily stay running, but what else can we do when we run a container?

1\. In your terminal, type `docker run --help`{{execute T1}} and let’s look at a list of run options, like we did before.<br>

> NOTE: The list is to large to print here. Consult the instructor if you think you aren’t getting the appropriate output.<br>

Here’s a list of some of the ones we will cover in this course:

```
-d,         --detach            Run container in background and print container ID
-e,         --env list          Set environment variables (default [])
-h,         --hostname string   Container host name
-i,         --interactive       Keep STDIN open even if not attached
--name string                   Assign a name to the container
--network string                Connect a container to a network (default “default”)
-t,         --tty               Allocate a pseudo-TTY
-v,         --volume list       Bind mount a volume (default [])
...
```

2\. Two of the most used options, we normally see put together. The options (`-i`) and (`-t`) can be put together (`-it`) when running a container to make it interactive. And we can use the (`--name`) option to add a unique name identifier. 

Try it out, like this:

`docker run -it --name Bert ubuntu:14.04`{{execute T1}} 

> **NOTE:** Notice that you are now inside the running container! Run (`pwd`) to see where you are inside the container.

3\. Using the secondary terminal window, check to see if your container is indeed running. Can you remember the command? (Look back at “Introduction to Docker Containers” if you can not.)

4\. Now, using that same secondary terminal window, launch another container in daemon mode by using the (`-d`) option. We will give it a name like we did previously, but this time we will also command (`echo`), arguement (`hey-there`), as follows:

`docker run -d --name Ernie ubuntu:14.04 echo hey-there`{{execute T2}}


5\. It’s important that you understand what just happened. You can see it by listing your running containers, but this time you’re gonna use (`-a`) to see all containers:

`docker ps -a`{{execute T2}}


Notice that only Bert is still running, the interactive (`-it`) one. Ernie, the one we assigned (`-d`), appears to have been exited. This is because Ernie was run in detach mode and given a specific command. Ernie simpling started up, execute it’s command, and exited out.

