
<img alt="Docker Banner" height="25%" width="100%" src="https://user-images.githubusercontent.com/21102559/41428354-d2fd1052-6fd7-11e8-8824-d4873955d89c.png">

## Deploying a Registry Server

**Objective:** This is a short and fairly simple lab. The objective is to show you how we can set up our own registry, much like our local registry, secure it and push and pull images to and from.<br>

**Preparation:** Navigate to the approrirate lab folder and then open a two terminal windows.<br>

**Outcome:** Students will set up a stand alone registry and even have the choice to establish one from a custom domain of their own.<br>

**Data Files:** `docker-compose.yaml`

A registry is a service for storing and accessing Docker images. [Docker Cloud](https://cloud.docker.com) and [Docker Store](https://store.docker.com) are the best-known hosted registries, which you can use to store public and private images. You can also run your own registry using the open-source [Docker Registry](https://docs.docker.com/registry), which is a Go application in a Alpine Linux container.

###### What You Will Learn

- run a local registry in a container and configure your Docker engine to use the registry;
- generate SSL certificates (using Docker!) and run a secure local registry with a friendly domain name;
- generate encrypted passwords (using Docker!) and run an authenticated, secure local registry over HTTPS with basic auth.

> NOTE: The open-source registry does not have a Web UI, so there's no friendly interface like [Docker Cloud](https://cloud.docker.com) or [Docker Store](https://store.docker.com). Instead there is a [REST API](https://docs.docker.com/registry/spec/api/) you can use to query the registry. For a local registry which has a Web UI and role-based access control, Docker, Inc. has the [Trusted Registry](https://www.docker.com/sites/default/files/Docker%20Trusted%20Registry.pdf) product.