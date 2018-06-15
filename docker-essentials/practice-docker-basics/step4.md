We are going to add one more element here and put it all together now. Later in this lesson we will wipe it all away to start fresh. When we talk about Docker though it is important that we talk about Dockerfiles. Remember, Dockerfiles make images, images make containers. Let’s get to work!

1\. In your secondary window, download this lesson's Dockerfile or consult the instructor on where you can find it. Once you've secured your Dockerfile, use VIM (`vi`) to open it up into the editor. 

Notice the sytaxt:

```
# Comment
INSTRUCTION arguments
```

Usage Definitions: 

```
FROM	   The base image to use in the build. This is mandatory and must be the first command in the file.
RUN	        Executes a command and save the result as a new layer
ADD	        Copies a file from the host system onto the container
WORKDIR	    Set the default working directory for the container
EXPOSE      Opens a port for linked containers
```

2\. Let’s talk about the ```build``` command. Enact the help menu for build to review syntax and addtional flag options:

`docker build --help`{{T2}}

Output:

```
docker build [OPTIONS] PATH | URL | -

Options:
      --build-arg list             Set build-time variables (default [])
      --cache-from stringSlice     Images to consider as cache sources
      --cgroup-parent string       Optional parent cgroup for the container
      --compress                   Compress the build context using gzip
      --cpu-period int             Limit the CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int              Limit the CPU CFS (Completely Fair Scheduler) quota
  -c, --cpu-shares int             CPU shares (relative weight)
      --cpuset-cpus string         CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string         MEMs in which to allow execution (0-3, 0,1)
      --disable-content-trust      Skip image verification (default true)
  -f, --file string                Name of the Dockerfile (Default is 'PATH/Dockerfile')
      --force-rm                   Always remove intermediate containers
      --help                       Print usage
      --isolation string           Container isolation technology
      --label list                 Set metadata for an image (default [])
  -m, --memory string              Memory limit
      --memory-swap string         Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --network string             Set the networking mode for the RUN instructions during build (default "default")
      --no-cache                   Do not use cache when building the image
      --pull                       Always attempt to pull a newer version of the image
  -q, --quiet                      Suppress the build output and print image ID on success
      --rm                         Remove intermediate containers after a successful build (default true)
      --security-opt stringSlice   Security options
      --shm-size string            Size of /dev/shm, default value is 64MB
      --squash                     Squash newly built layers into a single new layer
  -t, --tag list                   Name and optionally a tag in the 'name:tag' format (default [])
      --ulimit ulimit              Ulimit options (default [])
```

3\. Build an image from the Dockerfile now using the following command:

`docker build -t hello-world-example .`{{T2}}

>NOTE: Ask your instructor if you don't know where to find your Dockerfile.

4\. Once, the image is successfully built, we want to spin up a container from it, like this:

`docker run hello-world-example`{{T2}}

Output:

```
Traceback (most recent call last):
  File "hello.py", line 1, in <module>
    **hello-world**
NameError: name 'hello' is not defined
```

It ain't pretty, but it did run our `hello.py` file and print it's contents. From this you can begin to see how we might build an entire application like this.