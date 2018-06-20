Step 1 - Create Container

Data Containers are containers which sole responsibility to be a place to store/manage data.

Like other containers they are managed by the host system. However, they don't run when you perform a docker ps command.

To create a Data Container we first create a container with a well-known name for future reference. We use busybox as the base as it's small and lightweight in case we want to explore and move the container to another host.

When creating the container, we also provide a -v option to define where other containers will be reading/saving data.

1. Create a Data Container for storing configuration files using 

`docker create -v /config --name dataContainer busybox`{{execute T1}}


