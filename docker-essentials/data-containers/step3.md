Step 3 - Mount Volumes From

Now our Data Container has our config, we can reference the container when we launch dependent containers requiring the configuration file.

Using the `--volumes-from <container>` option we can use the mount volumes from other containers inside the container 
being launched. In this case, we'll launch an Ubuntu container which has reference to our Data Container. 
When we list the config directory, it will show the files from the attached container.

`docker run --volumes-from dataContainer ubuntu ls /config`{{execute T1}}

If a `/config` directory already existed then, the `volumes-from` would override and be the directory used. 
You can map multiple volumes to a container.
