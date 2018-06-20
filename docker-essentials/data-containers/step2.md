Step 2 - Copy Files

With the container in place, we can now copy files from our local client directory into the container.

To copy files into a container you use the command `docker cp`. The following command will copy the `config.conf` file 
into our dataContainer and the directory config.

`docker cp config.conf dataContainer:/config/`{{execute T1}}