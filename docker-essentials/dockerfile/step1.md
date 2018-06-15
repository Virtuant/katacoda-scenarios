Creating a new Dockerfile is easy. Follow alone to make a new directory and initialize a new, empty Dockerfile.

1\. Create a Dockerfile inside this directory:

```
$ cd myimage
$ vim Dockerfile
```

>NOTE: Vim is used by default, feel free to use another available text editor. Ask the instructor if this is confusing.
  
2\. Copy the following text inside the new Dockerfile:

<pre class="file" data-filename="Dockerfile" data-target="append"><blockquote>
FROM ubuntu
RUN apt-get -y update
RUN apt-get install -y figlet
</blockquote></pre>

3\. After saving the file, execute as follows:

`docker build -t myfiglet .`{{execute}}

Output:

```
Sending build context to Docker daemon 2.048 kB
Sending build context to Docker daemon
Step 0 : FROM ubuntu
---> xxxxxxxxxxxx
Step 1 : RUN apt-get update
---> Running in xxxxxxxxxxxx
---> xxxxxxxxxxxx
Removing intermediate container xxxxxxxxxxxx
Step 2 : RUN apt-get install figlet
---> Running in xxxxxxxxxxxx
---> xxxxxxxxxxxx
Removing intermediate container xxxxxxxxxxxx
Successfully built xxxxxxxxxxxx
```

>NOTE: Number's will defer depending on the build number, per host.

4\. Okay, spin up the new image using the (-it) to ensure our container is interactive. 

`docker run -it myfiglet`{{execute}}


5\. Now, the fun part! To confirm success, give it the following command, which is unique to Figlet:

`figlet hello`{{copy}}

_Pretty cool, huh?_

And of course, be sure to exit out of your container:
`exit`{{copy}}
