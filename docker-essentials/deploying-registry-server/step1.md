## Part 1 - The Basics of Docker Registry

There are several ways to run a registry container. The simplest is to run an insecure registry over HTTP, but for that we need to configure Docker to explicitly allow insecure access to the registry. 

---
Docker expects all registries to run on HTTPS. The next section of this lab will introduce a secure version of our registry container, but for this part of the tutorial we will run a version on HTTP. When registering a image, Docker returns an error message like this:

```
http: server gave HTTP response to HTTPS client
```

1\. The Docker Engine needs to be explicitly setup to use HTTP for the insecure registry. Edit or create `/etc/docker/docker` file: 

`vi /etc/docker/docker`{{execute}}

2\. Now, add this line:

`DOCKER_OPTS="--insecure-registry localhost:5000"`{{copy}}

3\. Close and save the file, then restart the docker daemon.

`service docker restart`{{execute}}

> **NOTE:** In **Docker for Mac**, the `Preferences` menu lets you set the address for an insecure registry under the `Daemon` panel. 
In **Docker for Windows**, the `Settings` menu lets you set the address for an insecure registry under the `Daemon` panel:
![MacOS menu](images/docker_windows_insecure_registry.png)
