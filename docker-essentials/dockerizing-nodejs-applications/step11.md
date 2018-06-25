1. With basic authentication, users cannot push or pull from the registry unless they are authenticated. If you try and pull an image without authenticating, you will get an error:

`docker pull localhost:5000/hello-world`{{execute}}

Output:

```
Using default tag: latest
Error response from daemon: Get https://localhost:5000/v2/hello-world/manifests/latest: no basic auth credentials
```

2. The result is the same for valid and invalid image names, so you can't even check a repository exists without authenticating. Logging in to the registry is the same `docker login` command you use for Docker Store, specifying the registry hostname:

`docker login registry.local:5000`{{execute}}


Output:

```
Username: moby
Password:
Login Succeeded
```

> **NOTE:** If you use the wrong password or a username that doesn't exist, you get a `401` error message:
```
Error response from daemon: login attempt to https://registry.local:5000/v2/ failed with status: 401 Unauthorized
```

3. Now you're authenticated, you can push and pull as before:

`sudo docker pull localhost:5000/hello-world`{{execute}}


Output:

```
Using default tag: latest
latest: Pulling from hello-world
Digest: sha256:961497c5ca49dc217a6275d4d64b5e4681dd3b2712d94974b8ce4762675720b4
Status: Image is up to date for registry.local:5000/hello-world:latest
```

> **NOTE:** The open-source registry does not support the same authorization model as Docker Store or Docker Trusted Registry. Once you are logged in to the registry, you can push and pull from any repository, there is no restriction to limit specific users to specific repositories.