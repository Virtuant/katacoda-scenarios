With the built Image it can be launched in a consistent way to other Docker Images. 
When a container launches, it's sandboxed from other processes and networks on the host. 
When starting a container you need to give it permission and access to what it requires.

For example, to open and bind to a network port on the host you need to provide the parameter 
`-p <host-port>:<container-port>`.

Launch our newly built image providing the friendly name and tag. 
As it's a web server, bind port 80 to our host using the `-p` parameter.

`docker run -d -p 80:80 webserver-image:v1`{{execute T1}}

Once started, you'll be able to access the results of port 80 via 

`curl docker`{{execute T1}}

To render the requests in the browser use the following links

<a href="https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/">https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/</a>

You now have a static HTML website being served by Nginx.