## Part 2 - Running a Secured Registry Container in Linux

We saw how to run a simple registry container in Part 1, using the official Docker registry image. The registry server con be configured to serve HTTPS traffic on a known domain, so it's straightforward to run a secure registry for private use with a self-signed SSL certificate.

1\. The Docker docs explain how to generate a self-signed certificate on Linux using OpenSSL:

`mkdir -p certs`{{execute}}

`openssl req -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt`{{execute}}

Output:

```
Generating a 4096 bit RSA private key
........++
............................................................++
writing new private key to 'certs/domain.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:US
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Docker
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:localhost
Email Address []:
```

If you are running the registry locally, be sure to use your host name as the CN. 

2\. To get the docker daemon to trust the certificate, copy the `domain.crt` file.

`sudo su`{{copy}}

`mkdir /etc/docker/certs.d`{{copy}}

`mkdir /etc/docker/certs.d/<localhost>:5000`{{copy}}

`cp `pwd`/certs/domain.crt /etc/docker/certs.d/<localhost>:5000/ca.crt`{{copy}}


3\. Make sure to restart the docker daemon.

`sudo service docker restart`{{execute}}

Now we have an SSL certificate and can run a secure registry.
