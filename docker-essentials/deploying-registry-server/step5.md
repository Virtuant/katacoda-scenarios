1\. Remove the existing registry container by removing the container which holds the storage layer. Any images pushed will be deleted:

`docker kill registry`{{execute}}

`docker rm registry`{{execute}}


In this example, the new container will use a host-mounted Docker volume. When the registry server in the container writes image layer data, it appears to be writing to a local directory in the container but it will be writing to a directory on the host.

2\. Create the registry:

`mkdir registry-data`{{execute}}

`docker run -d -p 5000:5000 --name registry -v `pwd`/registry-data:/var/lib/registry registry:2`{{execute}}

3\. Tag and push the container with the new IP address of the registry.

`docker tag hello-world localhost:5000/hello-world`{{execute}}

`docker push localhost:5000/hello-world`{{execute}}


4\. Repeating the previous `docker push` command uploads an image to the registry container, and the layers will be stored in the container's `/var/lib/registry` directory, which is actually mapped to the `$(pwd)/registry-data` directory on you local machine. The `tree` command will show the directory structure the registry server uses:

`tree registry-data`{{execute}}

Output:

```
.
|____docker
| |____registry
| | |____v2
| | | |____blobs
| | | | |____sha256
| | | | | |____1f
| | | | | | |____1fad42e8a0d9781677d366b1100defcadbe653280300cf62a23e07eb5e9d3a41
...
```

Storing data outside of the container means we can build a new version of the registry image and replace the old container with a new one using the same host mapping - so the new registry container has all the images stored by the previous container.

Using an insecure registry also isn't practical in multi-user scenarios. Effectively there's no security so anyone can push and pull images if they know the registry hostname. The registry server supports authentication, but only over a secure SSL connection. We'll run a secure version of the registry server in a container next.