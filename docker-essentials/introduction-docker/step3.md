1\. Now, we still don’t have a container running. We can verify that by running the command:

```
$ docker ps
```

2\. So, let’s spin up a container. By typing `docker run` into our terminal, we can review the run command’s structure, just like we did with docker pull.

Output:
```
docker run [OPTIONS] IMAGE [COMMAND] [ARG…]
```


3\. Using our new ```docker/whalesay``` image, let’s spin up a container, referring back to the previous step, if needed, for the appropriate structuring. We won’t need to enact any options and we know the image name. The command we are going to use is cowsay and we are going to input ```hello-world```. It should look like this:

`docker run docker/whalesay cowsay hello-world`{{execute}}

Output:
```
< hello-world >
 ----- 
    \
     \
      \     
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
        \    \        __/             
          \____\______/   
```
