
1\. We're ready to push an image into our secure registry. 

`docker push localhost:5000/hello-world`{{execute}}

`docker pull localhost:5000/hello-world`{{execute}}


We can go one step further with the open-source registry server, and add basic authentication - so we can require users to securely log in to push and pull images.