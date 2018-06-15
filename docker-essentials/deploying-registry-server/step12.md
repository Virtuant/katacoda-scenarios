Typing in all the options to start the registry can become tedious. An easier and simpler way is to use Docker Compose. We will discuss Compose in-depth in another lab, but let's just get a taste here. 

1\. Start by creating another file in your current directory and naming it `docker-compose.yml`, like this:

`mkdir docker-compose.yml`{{execute}}

2\. Now, once you've got a `docker-compose.yml` file, open it with an editor and copy the following into it:

```.yaml
registry:
  restart: always
  image: registry:2
  ports:
    - 5000:5000
  environment:
    REGISTRY_HTTP_TLS_CERTIFICATE: /certs/domain.crt
    REGISTRY_HTTP_TLS_KEY: /certs/domain.key
    REGISTRY_AUTH: htpasswd
    REGISTRY_AUTH_HTPASSWD_PATH: /auth/htpasswd
    REGISTRY_AUTH_HTPASSWD_REALM: Registry Realm
  volumes:
    - /path/registry-data:/var/lib/registry
    - /path/certs:/certs
    - /path/auth:/auth
```

3. To start the registry, type:

`docker-compose up`{{execute}}

