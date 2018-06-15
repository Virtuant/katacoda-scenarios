Adding authentication to the registry is a similar process to adding SSL - we need to run the registry with access to the `htpasswd` file on the host, and configure authentication using environment variables.

1. As before, we'll remove the existing container and run a new one with authentication configured:

`docker kill registry`{{execute}}

`docker rm registry`{{execute}}

`docker run -d -p 5000:5000 --name registry --restart unless-stopped -v $(pwd)/registry-data:/var/lib/registry -v $(pwd)/certs:/certs -v $(pwd)/auth:/auth -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key -e REGISTRY_AUTH=htpasswd -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e "REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd" registry`{{execute}}

> **NOTE:** The options for this container are:
- `-v $(pwd)/auth:/auth` - mount the local `auth` folder into the container, so the registry server can access `htpasswd` file;
- `-e REGISTRY_AUTH=htpasswd` - use the registry's `htpasswd` authentication method;
- `-e REGISTRY_AUTH_HTPASSWD_REALM='Registry Realm'` - specify the authentication realm;
- `-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd` - specify the location of the `htpasswd` file.

Now the registry is using secure transport and user authentication.
