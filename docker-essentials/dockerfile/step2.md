1\. Issue a command to see the history of our newest Dockerfile:

`docker history myfiglet`{{execute}}

2\. Let's change our Dockerfile to include JSON syntax, as follows:

<pre class="file" data-filename="Dockerfile" data-target="replace"><blockquote>
FROM ubuntu
RUN apt-get update
RUN ["apt-get", "install", "figlet"]
</blockquote></pre>

3\. Then, build the new Dockerfile again, just as we did before:

`$ docker build -t myfiglet .`{{execute}}

Output:

```
...
Successfully built xxxxxxxxxxxx
```

4\. Now, compare the new history along side the other:

`docker history myfiglet`{{execute}}

