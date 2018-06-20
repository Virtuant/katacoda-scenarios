Docker uses the hostname from the full image name to determine which registry to use. We can build images and include the local registry hostname in the image tag, or use the `docker tag` command to add a new tag to an existing image.

1\. These commands pull a public image from Docker Store, tag it for use in the private registry with the full name `localhost:5000/hello-world`, and then push it to the registry:

`docker tag hello-world localhost:5000/hello-world`{{execute}}

`docker push localhost:5000/hello-world`{{execute}}

2\. When you push the image to your local registry, you'll see similar output to when you push a public image to the Hub:

```
The push refers to a repository [localhost:5000/hello-world]
a55ad2cda2bf: Pushed
cfbe7916c207: Pushed
fe4c16cbf7a4: Pushed
latest: digest: sha256:79e028398829da5ce98799e733bf04ac2ee39979b238e4b358e321ec549da5d6 size: 948
```

3\. On the local machine, you can remove the new image tag and the original image, 
and pull it again from the local registry to verify it was correctly stored:


`docker rmi localhost:5000/hello-world`{{execute}}

`docker rmi hello-world`{{execute}}

`docker pull localhost:5000/hello-world`{{execute}}

That exercise shows the registry works correctly, but at the moment it's not very useful because all the image data is stored in the container's writable storage area, which will be lost when the container is removed. To store the data outside of the container, we need to mount a host directory when we start the container.

