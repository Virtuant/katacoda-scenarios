When we are baking up an image from a dockerfile, we need to consider which files we might we preinstalled onto our image. For that we will copy files from the "build context," which is the directory containing the Dockerfile. We can use this to "dockerize" a application. Check this out!

1\. Let's now create a new directory and name it `helloworld`. 

2\. Inside that directory we will create a new file, we will name that file `helloworld.c`, and we copy the following content into it:

```
int main () {
puts("Hello, world!");
return 0;
}
```

3\. Now, from inside our `helloworld` directory, create a new "Dockerfile" and copy the following code into it:

<pre class="file" data-filename="Dockerfile" data-target="replace"><blockquote>
FROM ubuntu
RUN apt-get update
RUN apt-get install -y build-essential
COPY helloworld.c /
RUN make helloworld
CMD /helloworld
</blockquote></pre>

> **NOTE:** See how we are using the COPY command in our Dockerfile to bring our application into our container. This is called "dockerizing" and it's very useful.

4\. Okay, now for the fun part! We can test our project as we have done before. First, let's build out our Dockerfile to create the image we will use, like this:

`docker build -t worldhello .`{{execute}}

5\. Run it! 

`docker run worldhello`{{execute}}

Well?
