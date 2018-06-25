## Part 3 - Using Basic Authentication with a Secured Registry in Linux

From "Part 2" we have a registry running in a Docker container, which we can securely access over HTTPS from any machine in our network. We used a self-signed certificate, which has security implications, but you could buy an SSL from a CA instead, and use that for your registry. With secure communication in place, we can set up user authentication.

---
The registry server and the Docker client support basic authentication over HTTPS. The server uses a file with a collection of usernames and encrypted passwords. The file uses Apache's `htpasswd`.

1\. Create the password file with an entry for user "moby" with password "gordon";

`mkdir auth`{{execute}}

`docker run --entrypoint htpasswd registry:latest -Bbn moby gordon > auth/htpasswd`{{execute}}

>The options are:
- `--entrypoint` Overwrite the default `ENTRYPOINT` of the image
- `-B` to force bcrypt vs default md5
- `-b` run in batch mode 
- `-n` display results

2\. We can verify the entries have been written by checking the file contents - which shows the user names in plain text and a cipher text password:

`cat auth/htpasswd`{{execute}}

Output:

```
moby:$2y$05$Geu2Z4LN0QDpUJBHvP5JVOsKOLH/XPoJBqISv1D8Aeh6LVGvjWWVC
```
