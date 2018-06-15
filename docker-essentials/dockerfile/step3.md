This step will show us how to add two important Dockerfile commands: `CMD` and `ENTRYPOINT`. These two commands are often used and can be of great benefit.
These commands allow us to set a default command to run in our container.

1\. We want to greet people who run a container from our image with a nice hello, and
we want a custom font to be used. For that, we will use the `CMD` to bake `figlet -f script hello` inside our Dockerfile Image.

So, the Dockerfile we are working on should look like:

<pre class="file" data-filename="Dockerfile" data-target="replace"><blockquote>
FROM ubuntu
RUN apt-get update
RUN ["apt-get", "install", "figlet"]
CMD figlet -f script hello
</blockquote></pre>

2\. Now that we've made our additions, let's build it:

`docker build -t myfiglet .`{{execute}}

Output:

```
...
Successfully built xxxxxxxxxxxx
```

3\. Let's run it, like always:

`docker run myfiglet`{{execute}}

Output:

```
 _          _   _       
| |        | | | |      
| |     _  | | | |  __  
|/ \   |/  |/  |/  /  \_
|   |_/|__/|__/|__/\__/ 
```

4\. Now, let's try to interject our own message upon running our image, like this:

`docker run myfiglet howdy!`{{execute}}

> **NOTE:** Our attempt to interject our own message fails, as it should.
    
5\. Let's replace ```CMD``` now with an ```ENTRYPOINT``` to see if that makes a difference. Open up the Dockerfile once again, and copy the following code in place of the existing, like this:

<pre class="file" data-filename="Dockerfile" data-target="replace"><blockquote>
FROM ubuntu
RUN apt-get update
RUN ["apt-get", "install", "figlet"]
ENTRYPOINT ["figlet", "-f", "script"]
</blockquote></pre>


6\. Okay, build it:

`docker build -t myfiglet .`{{execute}}

Output:

```
...
Successfully built xxxxxxxxxxxx
```

7\. And run it:

`docker run myfiglet howdy!`{{execute}}

Output:

```
 _                               
| |                    |        |
| |     __           __|        |
|/ \   /  \_|  |  |_/  |  |   | |
|   |_/\__/  \/ \/  \_/|_/ \_/|/o
                             /|  
                             \|  
```

Great job!

8\. Almost done! Let's add both ```CMD``` and ```ENTRYPOINT``` to our Dockerfile. This will give us the option to insert a custom message, or to print the default message. Confirm that your Dockerfile looks like this:

<pre class="file" data-filename="Dockerfile" data-target="replace"><blockquote>
FROM ubuntu
RUN apt-get update
RUN ["apt-get", "install", "figlet"]
ENTRYPOINT ["figlet", "-f", "script"]
CMD ["hello world"]
</blockquote></pre>


9\. Let's build it:

`docker build -t myfiglet .`{{execute}}

Output:

```
...
Successfully built xxxxxxxxxxxx
```

10\. And now run it and include a custom message:

`docker run myfiglet Ahoy`{{execute}}

Output:

```
  ___,   _                
 /   |  | |               
|    |  | |     __        
|    |  |/ \   /  \_|   | 
 \__/\_/|   |_/\__/  \_/|/
                       /| 
                       \| 
```

11\. Alright, if we were successful, we should be able to print our default message, like this:

`docker run myfiglet`{{execute}}

Output:

```
 _          _   _                             _        
| |        | | | |                           | |    |  
| |     _  | | | |  __             __   ,_   | |  __|  
|/ \   |/  |/  |/  /  \_  |  |  |_/  \_/  |  |/  /  |  
|   |_/|__/|__/|__/\__/    \/ \/  \__/    |_/|__/\_/|_/
```                                                    

> **NOTE:** What if we want to run a shell in our container? We cannot just do `docker run myfiglet bash` because that would just tell figlet to display the word "bash." We use the `--entrypoint` parameter, like this: `$ docker run -it --entrypoint bash figlet`
